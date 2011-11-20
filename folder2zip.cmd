@echo off
setlocal

rem ******************************************************************
rem ���k�t�@�C���`���ϊ��o�b�`�t�@�C��
rem   usage: folder2zip.cmd
rem ��folder2zip.exclude.txt ������΁A������Ă���t�@�C����
rem ���k�������珜�O���܂�
rem ******************************************************************

rem 7z�̎��s�t�@�C���t�H���_���p�X�ɒǉ�
set SZ_PATH=
for /D %%I in ("%ProgramFiles(x86)%\7-Zip") do set SZ_PATH=%%~I
for /D %%I in ("%ProgramFiles%\7-Zip")      do set SZ_PATH=%%~I
if "%SZ_PATH%"=="" goto :onerr_no_7z

path %path%;%GS_PATH%;%SZ_PATH%

set EXCLUDE_LIST=%~dpn0.exclude.txt

set DEST_DIR=.
if not %1.==. (
	set DEST_DIR=%1
	mkdir %DEST_DIR%>nul
)

rem ���k�p�R�}���h���C������
set _=
if exist "%EXCLUDE_LIST%" set _=%_% -x@"%EXCLUDE_LIST%"

rem ���k
for /d %%I in (*) do (
	echo "%%I"
	echo 7z a -tzip -mx9 %_% "%DEST_DIR%\%%I.zip" "%%I"
	7z a -tzip -mx9 %_% "%DEST_DIR%\%%I.zip" "%%I"
)

endlocal
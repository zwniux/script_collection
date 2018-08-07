#!/bin/bash

if [[ $1 == "" ]] ; then
  echo "input empty, nothing to zip"
  exit 0
fi

SRC_DIR=$1
DIR_LEN=${#SRC_DIR}

if [[ ${SRC_DIR:${DIR_LEN}-1:1} == "/" ]] ; then
  SRC_DIR=${SRC_DIR:0:${DIR_LEN}-1}
fi

ZIP_NAME=${SRC_DIR}_$(date +%Y%m%d_%H%M).zip

echo zip ${SRC_DIR} to ${ZIP_NAME}

zip -qur ${ZIP_NAME} ${SRC_DIR} -x "*.svn*" -x "*.git*" "*/build/*"

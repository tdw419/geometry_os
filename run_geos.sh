#!/bin/bash
rm -f /tmp/geos_stdin
mkfifo /tmp/geos_stdin
sleep 10000 > /tmp/geos_stdin &
exec ./target/release/geometry_os --cli < /tmp/geos_stdin > /tmp/geos_output.log 2>&1

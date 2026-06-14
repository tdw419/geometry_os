#!/bin/bash
# Run xv6 native kernel via Geometry OS MCP

BINARY_PATH="/home/jericho/projects/zion/projects/geometry_os/geometry_os/native/build/geos_native.bin"

echo "Loading xv6 native kernel from $BINARY_PATH..."
echo '{"method":"vm_run_program","params":{"source":"'"$BINARY_PATH"'"},"id":1}' | nc -U /tmp/geo_cmd.sock
echo ""
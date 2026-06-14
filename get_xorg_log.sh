#!/bin/bash

# Desktop test - get full Xorg log
set -e

DISK_IMAGE="$HOME/.geometry_os/vmfs/ubuntu_disk.img"
KERNEL_PATH="$HOME/.geometry_os/fs/linux/rv64/Image"

# Launch geometry_os
./target/release/geometry_os --cli > /tmp/geos_output.log 2>&1 &
GEOS_PID=$!
sleep 2

# Boot Ubuntu
echo "hypervisor_boot arch=riscv64 kernel=$KERNEL_PATH ram=256M display=vnc append=console=ttyS0 root=/dev/vda append=rw disk=$DISK_IMAGE" | nc -U /tmp/geo_cmd.sock

# Wait for boot
sleep 35

# Login
echo "hypervisor_input root" | nc -U /tmp/geo_cmd.sock > /dev/null
sleep 3
echo "hypervisor_input " | nc -U /tmp/geo_cmd.sock > /dev/null
sleep 2

# Get full Xorg log
echo "hypervisor_input cat /var/log/Xorg.0.log" | nc -U /tmp/geo_cmd.sock > /dev/null
sleep 2

# Get console output and save to file
echo "hypervisor_console" | nc -U /tmp/geo_cmd.sock > /tmp/xorg_full.log

# Cleanup
kill $GEOS_PID 2>/dev/null || true
rm -f /tmp/geo_cmd.sock

echo "Full Xorg log saved to /tmp/xorg_full.log"
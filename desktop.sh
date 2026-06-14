#!/bin/bash

# Boot Ubuntu, login, and start X11
echo "=== Ubuntu Desktop Launcher ==="

killall -9 qemu-system-riscv64 geometry_os 2>/dev/null
sleep 2
rm -f /tmp/geo_cmd.sock /tmp/geos_output.log

# Start geometry_os
./target/release/geometry_os --cli > /tmp/geos_output.log 2>&1 &
GEOS_PID=$!
sleep 2

# Boot with VNC
echo "Booting Ubuntu with VNC..."
DISK="$HOME/.geometry_os/vmfs/ubuntu_disk.img"
KERNEL="$HOME/.geometry_os/fs/linux/rv64/Image"
echo "hypervisor_boot arch=riscv64 kernel=$KERNEL ram=256M display=vnc append=console=ttyS0 root=/dev/vda append=rw disk=$DISK" | nc -U /tmp/geo_cmd.sock

# Wait for boot
echo "Waiting for Ubuntu boot (~35s)..."
sleep 35

# Check VNC
if nc -z localhost 5900; then
    echo "✓ VNC ready on port 5900"
else
    echo "✗ VNC not ready"
    kill $GEOS_PID 2>/dev/null
    exit 1
fi

# Login via serial console
echo ""
echo "Logging in as root..."
echo "hypervisor_input root" | nc -U /tmp/geo_cmd.sock > /dev/null
sleep 2
echo "hypervisor_input " | nc -U /tmp/geo_cmd.sock > /dev/null
sleep 2

# Start X11
echo "Starting X11 desktop..."
echo "hypervisor_input startx &" | nc -U /tmp/geo_cmd.sock > /dev/null
sleep 8

# Check X11 status
echo ""
echo "X11 Status:"
echo "hypervisor_console" | nc -U /tmp/geo_cmd.sock | grep -E "X Protocol|modeset|fb0|card0|GLX" | tail -15

echo ""
echo "=== Desktop Ready ==="
echo ""
echo "Connect with: vncviewer localhost:5900"
echo ""
echo "VM running. Press Ctrl+C to stop"
echo ""

wait $GEOS_PID
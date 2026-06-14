#!/bin/bash
echo "=== Ubuntu Desktop Launcher (VNC + X11 Debug) ==="
echo ""

# Cleanup
killall -9 qemu-system-riscv64 geometry_os 2>/dev/null
sleep 2
rm -f /tmp/geo_cmd.sock /tmp/geos_debug.log

# Start geometry_os
./target/release/geometry_os --cli > /tmp/geos_debug.log 2>&1 &
GEOS_PID=$!
sleep 3

# Boot Ubuntu with VNC
DISK="$HOME/.geometry_os/vmfs/ubuntu_disk.img"
KERNEL="$HOME/.geometry_os/fs/linux/rv64/Image"

echo "Booting..."
echo "hypervisor_boot arch=riscv64 kernel=$KERNEL ram=256M display=vnc append=console=ttyS0 root=/dev/vda append=rw disk=$DISK" | nc -U /tmp/geo_cmd.sock

# Wait for boot
echo "Waiting 50s for boot..."
sleep 50

# Login
echo "Login..."
echo "hypervisor_input root" | nc -U /tmp/geo_cmd.sock > /dev/null
sleep 2
echo "hypervisor_input " | nc -U /tmp/geo_cmd.sock > /dev/null
sleep 2

# Check for GPU device
echo ""
echo "=== Checking GPU devices ==="
echo "hypervisor_input 'ls -la /dev/dri/'" | nc -U /tmp/geo_cmd.sock
sleep 2

echo ""
echo "=== Checking framebuffer ==="
echo "hypervisor_input 'ls -la /dev/fb*'" | nc -U /tmp/geo_cmd.sock
sleep 2

# Start X11 with explicit config
echo ""
echo "=== Starting X11 ==="
echo "hypervisor_input 'Xorg -configure > /root/xorg.conf.new 2>&1 &'" | nc -U /tmp/geo_cmd.sock
sleep 5

echo "hypervisor_input 'startx 2>&1 | tee /root/x11_debug.log &'" | nc -U /tmp/geo_cmd.sock
sleep 10

# Check X11 status
echo ""
echo "=== Checking X11 processes ==="
echo "hypervisor_input 'ps aux | grep -i xorg'" | nc -U /tmp/geo_cmd.sock
sleep 2

# Check VNC
echo ""
echo "=== VNC Status ==="
if nc -z localhost 5900 2>/dev/null; then
    echo "✓ VNC listening on port 5900"
else
    echo "✗ VNC NOT listening on port 5900"
fi

echo ""
echo "Connect with: vncviewer localhost:5900"
echo "Press Ctrl+C to stop"
echo ""

wait $GEOS_PID
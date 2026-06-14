#!/bin/bash

# Launch Ubuntu RISC-V desktop with VNC
set -e

DISK_IMAGE="$HOME/.geometry_os/vmfs/ubuntu_disk.img"
KERNEL_PATH="$HOME/.geometry_os/fs/linux/rv64/Image"

echo "=== Ubuntu RISC-V Desktop Launcher ==="
echo ""
echo "This will:"
echo "  1. Boot Ubuntu with VNC display"
echo "  2. Log in via serial console"
echo "  3. Start X11 desktop"
echo "  4. Desktop appears in VNC viewer"
echo ""

# Clean up
killall -9 qemu-system-riscv64 geometry_os 2>/dev/null
sleep 2
rm -f /tmp/geo_cmd.sock /tmp/geos_output.log

# Launch geometry_os
echo "[1/4] Launching geometry_os..."
./target/release/geometry_os --cli > /tmp/geos_output.log 2>&1 &
GEOS_PID=$!
sleep 2

if [ ! -S /tmp/geo_cmd.sock ]; then
    echo "✗ Socket not found"
    exit 1
fi

# Boot Ubuntu with VNC
echo "[2/4] Booting Ubuntu with VNC display..."
echo "hypervisor_boot arch=riscv64 kernel=$KERNEL_PATH ram=256M display=vnc append=console=ttyS0 root=/dev/vda append=rw disk=$DISK_IMAGE" | nc -U /tmp/geo_cmd.sock

# Wait for VNC to be ready
echo ""
echo "Waiting for VNC server..."
for i in {1..15}; do
    if nc -z localhost 5900 2>/dev/null; then
        echo "✓ VNC ready on port 5900"
        break
    fi
    echo "  Waiting... ($i/15)"
    sleep 2
done

if ! nc -z localhost 5900 2>/dev/null; then
    echo "✗ VNC failed to start"
    kill $GEOS_PID 2>/dev/null
    exit 1
fi

# Wait for Ubuntu to boot
echo ""
echo "[3/4] Waiting for Ubuntu boot (~35s)..."
sleep 35

# Login via serial console
echo ""
echo "Logging in via serial console..."
echo "hypervisor_input root" | nc -U /tmp/geo_cmd.sock > /dev/null
sleep 2
echo "hypervisor_input " | nc -U /tmp/geo_cmd.sock > /dev/null  # Empty password
sleep 2

# Start X11 desktop
echo ""
echo "[4/4] Starting X11 desktop..."
echo "hypervisor_input export DISPLAY=:0" | nc -U /tmp/geo_cmd.sock > /dev/null
sleep 1
echo "hypervisor_input startx &" | nc -U /tmp/geo_cmd.sock > /dev/null
sleep 5

echo ""
echo "=== Desktop Launching ==="
echo ""
echo "VNC is ready! Connect with:"
echo "  vncviewer localhost:5900"
echo ""
echo "Desktop should appear in VNC window."
echo ""
echo "Serial console still available for commands:"
echo "  echo 'command' | nc -U /tmp/geo_cmd.sock"
echo ""
echo "Press Ctrl+C to stop VM"
echo ""

# Keep VM running
trap "kill $GEOS_PID 2>/dev/null; echo ''; echo 'VM stopped'; exit 0" INT TERM

wait $GEOS_PID
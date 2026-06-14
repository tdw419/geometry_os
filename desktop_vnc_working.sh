#!/bin/bash
# Ubuntu Desktop Launcher - VNC with geometry_os (corrected)

echo "=========================================="
echo "Ubuntu Desktop (VNC + X11)"
echo "=========================================="
echo ""
echo "VNC will be on: localhost:5900"
echo "Connect after ~60s with: vncviewer localhost:5900"
echo ""

# Cleanup
killall -9 qemu-system-riscv64 geometry_os 2>/dev/null
sleep 2
rm -f /tmp/geo_cmd.sock /tmp/geos_output.log

# Launch geometry_os
./target/release/geometry_os --cli > /tmp/geos_output.log 2>&1 &
GEOS_PID=$!
sleep 2

DISK="$HOME/.geometry_os/vmfs/ubuntu_disk.img"
KERNEL="$HOME/.geometry_os/fs/linux/rv64/Image"

echo "[1/4] Booting Ubuntu with VNC..."
echo "hypervisor_boot arch=riscv64 kernel=$KERNEL ram=2G display=vnc append=console=ttyS0 root=/dev/vda append=rw disk=$DISK" | nc -U /tmp/geo_cmd.sock

echo "[2/4] Waiting for VNC server..."
for i in {1..20}; do
    if nc -z localhost 5900 2>/dev/null; then
        echo "✓ VNC ready on port 5900"
        break
    fi
    if [ $i -eq 20 ]; then
        echo "✗ VNC failed to start"
        kill $GEOS_PID 2>/dev/null
        exit 1
    fi
    echo "  Waiting... ($i/20)"
    sleep 2
done

echo "[3/4] Waiting for Ubuntu boot (~50s)..."
sleep 50

echo "[4/4] Logging in and starting desktop..."
echo "hypervisor_input root" | nc -U /tmp/geo_cmd.sock > /dev/null
sleep 2
echo "hypervisor_input " | nc -U /tmp/geo_cmd.sock > /dev/null
sleep 2

# Configure and start X11 explicitly
echo "hypervisor_input 'export DISPLAY=:0'" | nc -U /tmp/geo_cmd.sock > /dev/null
sleep 1
echo "hypervisor_input 'startx 2>&1 > /root/x11.log &' | nc -U /tmp/geo_cmd.sock > /dev/null
sleep 10

echo ""
echo "=== Desktop Running ==="
echo ""
echo "Connect NOW: vncviewer localhost:5900"
echo ""
echo "To check X11 status inside VM:"
echo "  echo 'hypervisor_input cat /root/x11.log' | nc -U /tmp/geo_cmd.sock"
echo ""
echo "Press Ctrl+C to stop VM"
echo ""

trap "echo ''; echo 'Stopping VM...'; kill $GEOS_PID 2>/dev/null; exit 0" INT TERM

wait $GEOS_PID
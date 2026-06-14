#!/bin/bash
echo "=========================================="
echo "Ubuntu Desktop - VNC with Console"
echo "=========================================="
echo ""

killall -9 qemu-system-riscv64 geometry_os 2>/dev/null
sleep 2
rm -f /tmp/geo_cmd.sock /tmp/geos_output.log

./target/release/geometry_os --cli > /tmp/geos_output.log 2>&1 &
GEOS_PID=$!
sleep 2

DISK="$HOME/.geometry_os/vmfs/ubuntu_disk.img"
KERNEL="$HOME/.geometry_os/fs/linux/rv64/Image"

echo "[1/4] Booting with VNC + framebuffer console..."
echo "hypervisor_boot arch=riscv64 kernel=$KERNEL ram=2G display=vnc append='console=ttyS0 console=tty0 earlyprintk=virtio' append=root=/dev/vda append=rw disk=$DISK" | nc -U /tmp/geo_cmd.sock

echo "[2/4] Waiting for VNC..."
for i in {1..20}; do
    if nc -z localhost 5900 2>/dev/null; then
        echo "✓ VNC ready on port 5900"
        break
    fi
    if [ $i -eq 20 ]; then
        echo "✗ VNC failed"
        kill $GEOS_PID 2>/dev/null
        exit 1
    fi
    sleep 2
done

echo "[3/4] Waiting for boot (~50s)..."
sleep 50

echo ""
echo "✓ System booted!"
echo ""
echo "Connect with: vncviewer localhost:5900"
echo ""
echo "You should NOW see console output on the VNC screen"
echo "The framebuffer console makes text visible through virtio-gpu"
echo ""
echo "Press Ctrl+C to stop"
echo ""

wait $GEOS_PID
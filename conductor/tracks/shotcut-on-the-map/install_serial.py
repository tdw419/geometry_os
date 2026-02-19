#!/usr/bin/env python3
"""
Alpine installation via serial console.
Uses QEMU serial port for reliable text I/O.
"""
import subprocess
import time
import os
import pty
import select

# Paths
QCOW2 = "/home/jericho/zion/projects/geometry_os/geometry_os/conductor/tracks/shotcut-on-the-map/images/shotcut-alpine.qcow2"
ISO = "/home/jericho/zion/projects/geometry_os/geometry_os/conductor/tracks/shotcut-on-the-map/images/alpine-virt-3.19.0-x86_64.iso"

# Installation sequence: (wait_for_text, send_text, wait_seconds)
INSTALL_SEQUENCE = [
    ("localhost login:", "root\n", 3),
    ("#", "setup-alpine\n", 5),
    ("keyboard layout", "us\n", 2),
    ("variant", "us\n", 2),
    ("hostname", "shotcut-vm\n", 2),
    ("interface", "\n", 3),
    ("Ip address", "\n", 3),
    ("manual", "\n", 2),
    ("password", "root\n", 2),
    ("Retype", "root\n", 2),
    ("timezone", "UTC\n", 2),
    ("proxy", "\n", 2),
    ("mirror", "1\n", 5),
    ("ssh", "openssh\n", 2),
    ("ntp", "chrony\n", 2),
    ("disk", "vda\n", 2),
    ("use it", "sys\n", 2),
    ("Erase", "y\n", 180),  # 3 min for install
]

def main():
    print("=== Alpine Serial Console Installation ===\n")

    # Create fresh disk
    print("1. Creating fresh 8GB disk...")
    subprocess.run(["qemu-img", "create", "-f", "qcow2", QCOW2, "8G"], check=True)

    # Start QEMU with serial console
    print("2. Starting QEMU with serial console...")
    qemu_cmd = [
        "qemu-system-x86_64",
        "-m", "2048",
        "-smp", "2",
        "-drive", f"file={QCOW2},format=qcow2,if=virtio",
        "-cdrom", ISO,
        "-boot", "d",
        "-nographic",  # Serial console only
        "-serial", "mon:stdio",
        "-netdev", "user,id=net0,hostfwd=tcp::2222-:22",
        "-device", "virtio-net-pci,netdev=net0",
        "-enable-kvm",
    ]

    # Start QEMU process
    proc = subprocess.Popen(
        qemu_cmd,
        stdin=subprocess.PIPE,
        stdout=subprocess.PIPE,
        stderr=subprocess.STDOUT,
        text=True,
        bufsize=1
    )

    print("3. Waiting for boot and running installation...")
    print("   (This will take a few minutes)\n")

    buffer = ""

    def read_output(timeout=1):
        """Read available output from QEMU."""
        nonlocal buffer
        import select
        ready, _, _ = select.select([proc.stdout], [], [], timeout)
        if ready:
            data = proc.stdout.read(4096)
            if data:
                buffer += data
                print(data, end='', flush=True)
        return buffer

    def wait_for(text, timeout=60):
        """Wait for specific text in output."""
        nonlocal buffer
        start = time.time()
        while time.time() - start < timeout:
            read_output(0.5)
            if text.lower() in buffer.lower():
                return True
        return False

    def send(text):
        """Send text to QEMU."""
        proc.stdin.write(text)
        proc.stdin.flush()
        print(f">>> Sent: {repr(text)}")

    try:
        # Wait for initial boot
        time.sleep(15)
        read_output(5)

        # Run installation sequence
        for wait_text, send_text, wait_sec in INSTALL_SEQUENCE:
            print(f"\n--- Waiting for: '{wait_text}' ---")
            if wait_for(wait_text, timeout=60):
                time.sleep(0.5)
                send(send_text)
                time.sleep(wait_sec)
                read_output(1)
            else:
                print(f"WARNING: '{wait_text}' not found, sending anyway...")
                send(send_text)
                time.sleep(wait_sec)

        print("\n\n4. Installation complete! Waiting for final output...")
        time.sleep(5)
        read_output(2)

        # Poweroff
        print("\n5. Powering off...")
        send("poweroff\n")
        time.sleep(5)

    finally:
        proc.terminate()
        proc.wait(timeout=10)

    # Check result
    size = os.path.getsize(QCOW2)
    print(f"\n6. Disk image size: {size} bytes")
    if size > 10000000:  # > 10MB
        print("   SUCCESS: Installation appears complete!")
    else:
        print("   WARNING: Disk is small, installation may have failed.")

if __name__ == "__main__":
    main()

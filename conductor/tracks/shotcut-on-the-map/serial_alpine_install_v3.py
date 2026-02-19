#!/usr/bin/env python3
"""
Alpine Linux fresh installation via serial console.
Version 3 - with correct prompt order including SSH root login.
"""

import pexpect
import sys
import time

QEMU_CMD = """qemu-system-x86_64 \
    -m 2048 -smp 2 \
    -drive file=conductor/tracks/shotcut-on-the-map/images/shotcut-fresh.qcow2,format=qcow2,if=virtio \
    -cdrom conductor/tracks/shotcut-on-the-map/images/alpine-virt-3.19.0-x86_64.iso \
    -boot d \
    -netdev user,id=net0,hostfwd=tcp::2222-:22 \
    -device virtio-net-pci,netdev=net0 \
    -enable-kvm -nographic"""

def main():
    print("=" * 60)
    print("Alpine Linux Installation v3")
    print("=" * 60)

    child = pexpect.spawn('/bin/bash', ['-c', QEMU_CMD], encoding='utf-8', timeout=300)
    child.logfile = sys.stdout

    print("\n[*] Waiting for boot...")
    child.expect("localhost login:", timeout=120)
    print("\n[+] Boot complete!")

    child.sendline("root")
    time.sleep(2)
    child.sendline("setup-alpine")
    time.sleep(3)

    # Correct order for Alpine 3.19 setup-alpine:
    steps = [
        ("hostname", "shotcut-vm"),
        ("interface", "eth0"),
        ("Ip address", "dhcp"),
        ("manual network", "no"),
        ("New password:", "root"),
        ("Retype password:", "root"),
        ("timezone", "UTC"),
        ("proxy", "none"),
        ("mirror number", "1"),
        ("Setup a user", "no"),
        ("ssh server", "openssh"),
        ("root ssh login", "yes"),        # KEY: Enable root SSH
        ("ssh key or URL", "none"),       # No SSH key needed
        ("NTP client", "chrony"),
        ("disk.*would you like to use", "vda"),
        ("How would you like to use", "sys"),
        ("Erase", "y"),
    ]

    for pattern, response in steps:
        try:
            print(f"\n[*] Waiting: {pattern[:25]}...")
            child.expect(pattern, timeout=60)
            print(f"[+] Sending: {response}")
            child.sendline(response)
            time.sleep(1)
        except pexpect.TIMEOUT:
            print(f"[!] Timeout, sending: {response}")
            child.sendline(response)
            time.sleep(1)

    print("\n[*] Installing (3 min max)...")
    try:
        child.expect(["Installation is complete", "Please reboot"], timeout=180)
        print("\n[+] SUCCESS!")
    except pexpect.TIMEOUT:
        print("\n[!] Timeout")

    child.sendline("poweroff")
    time.sleep(5)
    child.close()
    print("\n" + "=" * 60)
    print("Done! Disk: shotcut-fresh.qcow2")
    print("SSH: ssh -p 2222 root@localhost (password: root)")
    print("=" * 60)

if __name__ == "__main__":
    main()

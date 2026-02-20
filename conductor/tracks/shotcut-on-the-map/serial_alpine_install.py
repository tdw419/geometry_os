#!/usr/bin/env python3
"""
Alpine Linux fresh installation via serial console (stdio).
Uses pexpect to interact with QEMU's stdin/stdout directly.
"""

import pexpect
import sys
import time

# QEMU command with serial on stdio
QEMU_CMD = """qemu-system-x86_64 \
    -m 2048 \
    -smp 2 \
    -drive file=conductor/tracks/shotcut-on-the-map/images/shotcut-fresh.qcow2,format=qcow2,if=virtio \
    -cdrom conductor/tracks/shotcut-on-the-map/images/alpine-virt-3.19.0-x86_64.iso \
    -boot d \
    -netdev user,id=net0,hostfwd=tcp::2222-:22 \
    -device virtio-net-pci,netdev=net0 \
    -enable-kvm \
    -nographic"""


def main():
    print("=" * 60)
    print("Alpine Linux Fresh Installation (Serial Console)")
    print("=" * 60)
    print()

    # Spawn QEMU process
    print("[*] Starting QEMU...")
    child = pexpect.spawn('/bin/bash', ['-c', QEMU_CMD], encoding='utf-8', timeout=300)
    child.logfile = sys.stdout

    # Wait for login prompt
    print("\n[*] Waiting for boot (looking for login prompt)...")
    try:
        child.expect("localhost login:", timeout=120)
        print("\n[+] Boot complete! Login prompt found.")
    except pexpect.TIMEOUT:
        print("\n[-] Timeout waiting for login prompt")
        child.close()
        return

    # Login as root (no password initially)
    print("[*] Logging in as root...")
    child.sendline("root")
    time.sleep(2)

    # Run setup-alpine
    print("[*] Starting setup-alpine...")
    child.sendline("setup-alpine")
    time.sleep(3)

    # Installation steps - prompt patterns and responses
    steps = [
        ("keyboard layout", "us"),
        ("variant", "us"),
        ("hostname", "shotcut-vm"),
        ("interface", "eth0"),
        ("Ip address", "dhcp"),
        ("manual network", "no"),
        ("New password", "root"),
        ("Retype password", "root"),
        ("timezone", "UTC"),
        ("proxy", "none"),
        ("mirror", "1"),
        ("SSH server", "openssh"),
        ("NTP client", "chrony"),
        ("disk", "vda"),
        ("use it", "sys"),
        ("Erase", "y"),
    ]

    for prompt_text, response in steps:
        try:
            print(f"\n[*] Waiting for: '{prompt_text}'")
            child.expect(prompt_text, timeout=30)
            print(f"[+] Found! Sending: '{response}'")
            child.sendline(response)
            time.sleep(1)
        except pexpect.TIMEOUT:
            print(f"[!] Timeout for '{prompt_text}', sending anyway: '{response}'")
            child.sendline(response)
            time.sleep(1)
        except Exception as e:
            print(f"[!] Error: {e}")
            child.sendline(response)
            time.sleep(1)

    # Wait for installation to complete
    print("\n[*] Waiting for installation to complete (up to 3 minutes)...")
    try:
        child.expect(["Installation is complete", "Please reboot"], timeout=180)
        print("\n[+] Installation complete!")
    except pexpect.TIMEOUT:
        print("\n[!] Timeout waiting for completion message")

    # Power off
    print("[*] Powering off...")
    child.sendline("poweroff")
    time.sleep(5)

    child.close()
    print("\n" + "=" * 60)
    print("Stage 1 Complete!")
    print("=" * 60)


if __name__ == "__main__":
    main()

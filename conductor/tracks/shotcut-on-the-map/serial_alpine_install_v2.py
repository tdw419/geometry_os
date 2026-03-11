#!/usr/bin/env python3
"""
Alpine Linux fresh installation via serial console.
Corrected prompt order based on actual Alpine setup-alpine flow.
"""

import pexpect
import sys
import time

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
    print("Alpine Linux Installation (Serial Console) v2")
    print("=" * 60)

    print("\n[*] Starting QEMU...")
    child = pexpect.spawn('/bin/bash', ['-c', QEMU_CMD], encoding='utf-8', timeout=300)
    child.logfile = sys.stdout

    # Wait for login prompt
    print("\n[*] Waiting for boot...")
    try:
        child.expect("localhost login:", timeout=120)
        print("\n[+] Boot complete!")
    except pexpect.TIMEOUT:
        print("\n[-] Timeout waiting for boot")
        child.close()
        return

    # Login as root
    print("[*] Logging in as root...")
    child.sendline("root")
    time.sleep(2)

    # Run setup-alpine
    print("[*] Running setup-alpine...")
    child.sendline("setup-alpine")
    time.sleep(3)

    # CORRECTED prompt order for Alpine 3.19:
    steps = [
        ("hostname", "shotcut-vm"),        # 1. Hostname first
        ("interface", "eth0"),              # 2. Network interface
        ("Ip address", "dhcp"),             # 3. IP config
        ("manual network", "no"),           # 4. Manual network
        ("New password:", "root"),          # 5. Root password
        ("Retype password:", "root"),       # 6. Confirm password
        ("timezone", "UTC"),                # 7. Timezone
        ("proxy", "none"),                  # 8. Proxy
        ("mirror number", "1"),             # 9. APK mirror
        ("Setup a user", "no"),             # 10. NO user setup (key!)
        ("SSH server", "openssh"),          # 11. SSH
        ("NTP client", "chrony"),           # 12. NTP
        ("disk.*would you like to use", "vda"),  # 13. Disk
        ("How would you like to use", "sys"),    # 14. Install mode
        ("Erase", "y"),                     # 15. Confirm erase
    ]

    for pattern, response in steps:
        try:
            print(f"\n[*] Waiting for: '{pattern[:30]}...'")
            child.expect(pattern, timeout=60)
            print(f"[+] Found! Sending: '{response}'")
            child.sendline(response)
            time.sleep(1)
        except pexpect.TIMEOUT:
            print(f"[!] Timeout, sending anyway: '{response}'")
            child.sendline(response)
            time.sleep(1)

    # Wait for installation
    print("\n[*] Waiting for installation (3 min max)...")
    try:
        child.expect(["Installation is complete", "Please reboot"], timeout=180)
        print("\n[+] Installation complete!")
    except pexpect.TIMEOUT:
        print("\n[!] Timeout - checking status...")

    # Power off
    print("[*] Powering off...")
    child.sendline("poweroff")
    time.sleep(5)

    child.close()
    print("\n" + "=" * 60)
    print("Stage 1 Complete!")
    print("Disk: conductor/tracks/shotcut-on-the-map/images/shotcut-fresh.qcow2")
    print("=" * 60)


if __name__ == "__main__":
    main()

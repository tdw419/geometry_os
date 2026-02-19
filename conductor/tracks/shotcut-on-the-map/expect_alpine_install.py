#!/usr/bin/env python3
"""
Alpine Linux installation using pexpect over serial console.
"""

import pexpect
import sys
import time

def main():
    print("=== Alpine Linux Serial Console Installation ===\n")

    # Find the PTY device
    pty_device = "/dev/pts/14"
    print(f"[*] Connecting to {pty_device}...")

    # Connect to the serial console
    try:
        child = pexpect.spawn(f"cat {pty_device}", encoding="utf-8", timeout=120)
    except Exception as e:
        print(f"[-] Failed to connect: {e}")
        return

    # Wait for login prompt
    print("[*] Waiting for login prompt...")
    try:
        child.expect("localhost login:", timeout=60)
        print("[+] Login prompt found!")
    except pexpect.TIMEOUT:
        print("[-] Timeout waiting for login prompt")
        child.close()
        return

    # Actually we need to write TO the PTY, not read from it
    # Let's use a different approach - open the PTY for writing
    child.close()

    # Open PTY for writing
    try:
        pty = open(pty_device, "w", buffering=1)  # Line buffered
        print("[+] Opened PTY for writing")
    except Exception as e:
        print(f"[-] Failed to open PTY: {e}")
        return

    # Login as root
    print("[*] Sending 'root'...")
    pty.write("root\n")
    time.sleep(3)

    # Run setup-alpine
    print("[*] Running setup-alpine...")
    pty.write("setup-alpine\n")
    time.sleep(5)

    # Installation steps
    steps = [
        ("us", "keyboard layout"),
        ("us", "variant"),
        ("shotcut-vm", "hostname"),
        ("eth0", "interface"),
        ("dhcp", "ip address"),
        ("no", "manual network"),
        ("root", "password"),
        ("root", "retype password"),
        ("UTC", "timezone"),
        ("none", "proxy"),
        ("1", "mirror"),
        ("openssh", "ssh server"),
        ("chrony", "ntp client"),
        ("vda", "disk"),
        ("sys", "use disk"),
        ("y", "erase disk"),
    ]

    for response, desc in steps:
        print(f"[*] Sending: '{response}' (for {desc})")
        pty.write(f"{response}\n")
        time.sleep(3)

    print("[*] Installation in progress...")
    print("[*] Waiting 2 minutes for installation to complete...")
    time.sleep(120)

    # Power off
    print("[*] Powering off...")
    pty.write("poweroff\n")
    time.sleep(3)

    pty.close()
    print("\n=== Stage 1 Complete ===")

if __name__ == "__main__":
    main()

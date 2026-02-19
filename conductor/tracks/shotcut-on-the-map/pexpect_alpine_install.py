#!/usr/bin/env python3
"""
Alpine Linux installation using pexpect over PTY.
Properly waits for prompts before responding.
"""

import pexpect
import sys
import time

PTY_DEVICE = "/dev/pts/14"

def main():
    print("=== Alpine Installation via pexpect ===\n")

    # Spawn a process that reads/writes to the PTY
    # We use 'screen' to connect to the PTY properly
    cmd = f"screen -D -m -S alpine {PTY_DEVICE} 115200"

    # Alternative: direct PTY interaction using pexpect.fdpexpect
    import pexpect.fdpexpect

    # Open the PTY for reading and writing
    try:
        fd = os.open(PTY_DEVICE, os.O_RDWR | os.O_NONBLOCK)
        child = pexpect.fdpexpect.fdspawn(fd, encoding='utf-8', timeout=120)
        print(f"[+] Connected to {PTY_DEVICE}")
    except Exception as e:
        print(f"[-] Failed to connect: {e}")
        return

    # First, check current state
    child.sendline("")
    try:
        child.expect(["#", "login:", "$"], timeout=5)
        print(f"[+] Current state matched: {child.after}")
    except:
        print("[*] Checking state...")

    # If at login, login as root
    try:
        child.expect("login:", timeout=2)
        print("[*] At login prompt, logging in...")
        child.sendline("root")
        child.expect("#", timeout=5)
        print("[+] Logged in!")
    except:
        print("[*] Already logged in or different state")

    # Run setup-alpine
    print("[*] Running setup-alpine...")
    child.sendline("setup-alpine")
    time.sleep(2)

    # Installation steps with prompts
    steps = [
        ("keyboard layout", "us"),
        ("variant", "us"),
        ("hostname", "shotcut-vm"),
        ("interface", "eth0"),
        ("Ip address", "dhcp"),
        ("manual network", "no"),
        ("password", "root"),
        ("Retype password", "root"),
        ("timezone", "UTC"),
        ("proxy", "none"),
        ("mirror", "1"),
        ("SSH server", "openssh"),
        ("NTP client", "chrony"),
        ("disk", "vda"),
        ("How would you like to use", "sys"),
        ("Erase", "y"),
    ]

    for prompt_text, response in steps:
        try:
            child.expect(prompt_text, timeout=30)
            print(f"[+] Found prompt: {prompt_text}")
            child.sendline(response)
            print(f"[>] Sent: {response}")
            time.sleep(1)
        except pexpect.TIMEOUT:
            print(f"[!] Timeout waiting for: {prompt_text}")
            print(f"[*] Sending anyway: {response}")
            child.sendline(response)
            time.sleep(1)
        except Exception as e:
            print(f"[!] Error: {e}")

    # Wait for installation to complete
    print("[*] Waiting for installation...")
    try:
        child.expect(["Installation is complete", "Please reboot"], timeout=180)
        print("[+] Installation complete!")
    except pexpect.TIMEOUT:
        print("[!] Timeout waiting for completion")

    # Power off
    print("[*] Powering off...")
    child.sendline("poweroff")
    time.sleep(3)

    os.close(fd)
    print("\n=== Stage 1 Complete ===")

if __name__ == "__main__":
    import os
    main()

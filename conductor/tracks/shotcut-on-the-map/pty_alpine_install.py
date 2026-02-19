#!/usr/bin/env python3
"""
Alpine Linux installation via PTY serial console.
Simple approach using file operations.
"""

import time
import os

PTY_DEVICE = "/dev/pts/14"

def write_pty(text):
    """Write to PTY."""
    with open(PTY_DEVICE, "w") as f:
        f.write(text + "\n")
    print(f"[>] Sent: {text}")

def read_pty(timeout=2):
    """Read from PTY with timeout."""
    import select
    output = ""
    end_time = time.time() + timeout
    while time.time() < end_time:
        ready, _, _ = select.select([PTY_DEVICE], [], [], 0.5)
        if ready:
            with open(PTY_DEVICE, "r") as f:
                try:
                    chunk = f.read(4096)
                    output += chunk
                except:
                    pass
    return output

def main():
    print("=== Alpine Installation via PTY ===\n")

    # Wait for system to be ready
    print("[*] Waiting for system...")
    time.sleep(2)

    # Run setup-alpine
    write_pty("setup-alpine")
    time.sleep(5)

    # Installation steps - each response with delay
    steps = [
        ("us", 3),      # keyboard layout
        ("us", 3),      # variant
        ("shotcut-vm", 3),  # hostname
        ("eth0", 3),    # interface
        ("dhcp", 3),    # ip address
        ("no", 3),      # manual network
        ("root", 3),    # password
        ("root", 3),    # retype password
        ("UTC", 3),     # timezone
        ("none", 3),    # proxy
        ("1", 3),       # mirror
        ("openssh", 3), # ssh server
        ("chrony", 3),  # ntp client
        ("vda", 3),     # disk
        ("sys", 3),     # use disk
        ("y", 5),       # erase disk
    ]

    for response, delay in steps:
        write_pty(response)
        time.sleep(delay)

    print("\n[*] Installation in progress...")
    print("[*] Waiting 60 seconds for installation...")
    time.sleep(60)

    # Check status
    write_pty("")
    time.sleep(2)

    # Poweroff
    write_pty("poweroff")
    time.sleep(3)

    print("\n=== Stage 1 Complete ===")

if __name__ == "__main__":
    main()

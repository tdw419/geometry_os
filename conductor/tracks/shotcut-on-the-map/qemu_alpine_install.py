#!/usr/bin/env python3
"""
Alpine Linux installation using QEMU monitor socket.
"""

import socket
import subprocess
import time
import os
import glob

def find_qemu_socket():
    """Find the QEMU monitor socket."""
    sockets = glob.glob("/tmp/qemu-monitor-*.sock")
    if sockets:
        return sockets[0]
    return None

def send_key(sock, key):
    """Send a key via QEMU monitor."""
    cmd = f"sendkey {key}\n"
    sock.send(cmd.encode())
    time.sleep(0.1)

def type_string(sock, text):
    """Type a string character by character."""
    for char in text:
        if char == '\n':
            send_key(sock, "ret")
        elif char == ' ':
            send_key(sock, "spc")
        elif char == '-':
            send_key(sock, "minus")
        elif char == '.':
            send_key(sock, "dot")
        elif char == '/':
            send_key(sock, "slash")
        elif char == ':':
            send_key(sock, "shift-colon")
        elif char.isupper():
            send_key(sock, f"shift-{char.lower()}")
        elif char.isdigit():
            send_key(sock, char)
        else:
            send_key(sock, char)
        time.sleep(0.05)

def take_screenshot(path="/tmp/vm_screenshot.png"):
    """Take a VNC screenshot."""
    result = subprocess.run(
        ["vncsnapshot", "-quiet", "127.0.0.1:0", path],
        capture_output=True
    )
    return result.returncode == 0

def ocr_screenshot(path="/tmp/vm_screenshot.png"):
    """Run OCR on a screenshot."""
    result = subprocess.run(
        ["tesseract", path, "stdout"],
        capture_output=True,
        text=True
    )
    return result.stdout

def wait_for_text(expected, timeout=60):
    """Wait for expected text to appear."""
    for i in range(timeout):
        if take_screenshot():
            text = ocr_screenshot()
            if expected.lower() in text.lower():
                print(f"[+] Found: '{expected}'")
                return True
        time.sleep(1)
        if i % 5 == 0:
            print(f"[*] Waiting for '{expected}'... ({i}s)")
    return False

def main():
    print("=== QEMU Monitor Alpine Installation ===\n")

    # Find QEMU socket
    socket_path = find_qemu_socket()
    if not socket_path:
        print("[-] No QEMU monitor socket found!")
        return
    print(f"[*] Found socket: {socket_path}")

    # Connect to QEMU monitor
    sock = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
    sock.connect(socket_path)
    sock.setblocking(False)
    print("[+] Connected to QEMU monitor")

    # Wait for login prompt
    print("[*] Waiting for login prompt...")
    if not wait_for_text("localhost login:", timeout=30):
        print("[-] Timeout waiting for login prompt")
        sock.close()
        return

    # Login as root
    print("[*] Logging in as root...")
    type_string(sock, "root\n")
    time.sleep(2)

    # Check login
    take_screenshot()
    text = ocr_screenshot()
    print(f"[*] Console: {text[:200]}...")

    # Run setup-alpine
    print("[*] Running setup-alpine...")
    type_string(sock, "setup-alpine\n")
    time.sleep(3)

    # Installation steps
    steps = [
        ("us\n", "keyboard layout"),
        ("us\n", "variant"),
        ("shotcut-vm\n", "hostname"),
        ("eth0\n", "interface"),
        ("dhcp\n", "ip address"),
        ("no\n", "manual network"),
        ("root\n", "password"),
        ("root\n", "retype password"),
        ("UTC\n", "timezone"),
        ("none\n", "proxy"),
        ("1\n", "mirror"),
        ("openssh\n", "ssh server"),
        ("chrony\n", "ntp client"),
        ("vda\n", "disk"),
        ("sys\n", "use disk"),
        ("y\n", "erase disk"),
    ]

    for response, desc in steps:
        print(f"[*] Sending: '{response.strip()}' (for {desc})")
        type_string(sock, response)
        time.sleep(2)

    print("[*] Waiting for installation to complete...")
    for i in range(120):
        time.sleep(1)
        if i % 10 == 0:
            take_screenshot()
            text = ocr_screenshot()
            print(f"[{i}s] Status: {text[:100]}...")
            if "Installation is complete" in text or "Please reboot" in text:
                print("[+] Installation complete!")
                break

    # Power off
    print("[*] Powering off...")
    type_string(sock, "poweroff\n")
    time.sleep(3)

    sock.close()
    print("\n=== Stage 1 Complete ===")

if __name__ == "__main__":
    main()

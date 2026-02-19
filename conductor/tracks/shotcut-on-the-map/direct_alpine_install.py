#!/usr/bin/env python3
"""
Direct Alpine Linux installation using VNC
Bypasses the bridge and uses vncdotool directly.
"""

import subprocess
import time
import os

def run_vncdo(command):
    """Run a vncdo command."""
    cmd = f"vncdo 127.0.0.1:0 {command}"
    result = subprocess.run(cmd, shell=True, capture_output=True, text=True)
    return result

def screenshot(save_path="/tmp/vm_state.png"):
    """Take a screenshot."""
    subprocess.run(f"vncsnapshot -quiet 127.0.0.1:0 {save_path}", shell=True)
    return save_path

def ocr(image_path):
    """Run OCR on an image."""
    result = subprocess.run(f"tesseract {image_path} stdout 2>/dev/null", shell=True, capture_output=True, text=True)
    return result.stdout

def type_text(text):
    """Type text with Enter."""
    # Escape special characters for vncdo
    escaped = text.replace(" ", "space:")
    for char in text:
        if char == "\n":
            run_vncdo("key enter")
        elif char == " ":
            run_vncdo("key space")
        else:
            run_vncdo(f"type {char}")
        time.sleep(0.05)
    if not text.endswith("\n"):
        run_vncdo("key enter")

def wait_for_prompt(expected, timeout=60):
    """Wait for expected text to appear."""
    for i in range(timeout):
        screenshot()
        text = ocr("/tmp/vm_state.png")
        if expected.lower() in text.lower():
            print(f"[+] Found: '{expected}'")
            return True
        time.sleep(1)
        if i % 10 == 0:
            print(f"[*] Waiting for '{expected}'... ({i}s)")
    return False

def main():
    print("=== Direct Alpine Linux Installation ===")
    print()

    # The VM should already be running with VNC on :0

    # Wait for login prompt
    print("[*] Waiting for login prompt...")
    if not wait_for_prompt("localhost login:", timeout=30):
        print("[-] Timeout waiting for login prompt")
        return

    # Login as root
    print("[*] Logging in as root...")
    run_vncdo("type root")
    run_vncdo("key enter")
    time.sleep(2)

    # Check if we're logged in
    screenshot()
    text = ocr("/tmp/vm_state.png")
    print(f"[*] Console: {text[:200]}")

    # Run setup-alpine
    print("[*] Running setup-alpine...")
    run_vncdo("type setup-alpine")
    run_vncdo("key enter")
    time.sleep(3)

    # Installation steps
    steps = [
        ("keyboard layout", "us"),
        ("variant", "us"),
        ("hostname", "shotcut-vm"),
        ("interface", "eth0"),
        ("ip address", "dhcp"),
        ("manual network", "no"),
        ("password", "root"),
        ("retype", "root"),
        ("timezone", "UTC"),
        ("proxy", "none"),
        ("mirror", "1"),
        ("ssh server", "openssh"),
        ("ntp client", "chrony"),
        ("disk", "vda"),
        ("use it", "sys"),
        ("erase", "y"),
    ]

    for prompt_text, response in steps:
        print(f"[*] Sending: '{response}' (for {prompt_text})")
        time.sleep(2)
        for char in response:
            run_vncdo(f"type {char}")
            time.sleep(0.05)
        run_vncdo("key enter")

    print("[*] Waiting for installation to complete...")
    for i in range(120):  # 2 minutes
        time.sleep(1)
        if i % 10 == 0:
            screenshot()
            text = ocr("/tmp/vm_state.png")
            print(f"[{i}s] Status: {text[:100]}...")
            if "Installation is complete" in text or "Please reboot" in text:
                print("[+] Installation complete!")
                break

    print("[*] Powering off...")
    run_vncdo("type poweroff")
    run_vncdo("key enter")
    time.sleep(3)

    print()
    print("=== Stage 1 Complete ===")

if __name__ == "__main__":
    main()

#!/usr/bin/env python3
"""
Automated Alpine Linux installation for Geometry OS

This script uses the ShotcutAgent to automate the interactive installation
of Alpine Linux in a QEMU VM.
"""

from shotcut_agent import ShotcutAgent
import asyncio
import os
import sys
import base64
from pathlib import Path

# Add script directory to sys.path to find ShotcutAgent
sys.path.append(os.path.dirname(os.path.abspath(__file__)))


async def automate_install():
    agent = ShotcutAgent(bridge_url="ws://127.0.0.1:8768")
    iso_path = "conductor/tracks/shotcut-on-the-map/images/alpine-virt-3.19.0-x86_64.iso"

    print(f"[*] Booting VM with ISO: {iso_path}")
    boot_res = await agent._send_command("boot", {
        "iso": iso_path,
        "memory": 2048,
        "cpus": 2
    })

    if not boot_res.get("success"):
        print(f"Error booting: {boot_res.get('error')}")
        return

    print("[*] Waiting for boot prompt...")
    # Wait for localhost login prompt
    for i in range(120):  # 120 seconds timeout
        await asyncio.sleep(5)
        img, text = await agent.see()
        print(f"[{i * 5}s] Console output: {text.strip()[:100]}...")

        if "localhost login:" in text or "login:" in text.lower():
            print("[+] Login prompt found!")
            break
        elif "booting" in text.lower() or "loading" in text.lower():
            continue
        elif i > 10 and not text.strip():
            # If it's blank but it's been a while, maybe it's graphical or something
            # In this case it should be text mode
            pass
    else:
        print("[-] Timeout waiting for login prompt")
        # Save last screenshot for debugging
        await agent.see("install_timeout.png")
        return

    # 1. Login as root
    print("[*] Logging in as root...")
    await agent.type_text("root\n")
    await asyncio.sleep(2)

    # 2. Run setup-alpine
    print("[*] Running setup-alpine...")
    await agent.type_text("setup-alpine\n")
    await asyncio.sleep(5)

    # Sequence of responses to setup-alpine
    # Keyboard layout: us
    # Keyboard variant: us
    # Hostname: shotcut-vm
    # Interface: eth0 (default)
    # IP: dhcp (default)
    # No manual network config.
    # Set root password: root
    # Timezone: UTC (default)
    # Proxy: none (default)
    # Mirror: 1 (default)
    # SSH server: openssh (default)
    # NTP client: chrony (default)
    # Install to which disk: vda
    # How to use it: sys
    # Erase disk and continue? y

    steps = [
        ("Select keyboard layout [none]:", "us\n"),
        ("Select variant [us]:", "us\n"),
        ("Enter system hostname [localhost]:", "shotcut-vm\n"),
        ("Which one do you want to initialize? [eth0]", "eth0\n"),
        ("Ip address for eth0? [dhcp]", "dhcp\n"),
        ("Do you want to do any manual network configuration?", "no\n"),
        ("New password:", "root\n"),
        ("Retype password:", "root\n"),
        ("Which timezone are you in? [UTC]", "UTC\n"),
        ("HTTP/FTP proxy URL? [none]", "none\n"),
        ("Select a mirror [1]:", "1\n"),
        ("Which SSH server? [openssh]", "openssh\n"),
        ("Which NTP client? [chrony]", "chrony\n"),
        ("Which disk(s) would you like to use? [none]", "vda\n"),
        ("How would you like to use it? [sys]", "sys\n"),
        ("WARNING: Erase the above disk(s) and continue? [n]", "y\n")
    ]

    for prompt, response in steps:
        print(f"[*] Waiting for prompt: '{prompt}'")
        for _ in range(30):
            img, text = await agent.see()
            if prompt in text or prompt.lower() in text.lower():
                print(f"[+] Found prompt. Sending: '{response.strip()}'")
                await agent.type_text(response)
                await asyncio.sleep(2)
                break
            await asyncio.sleep(2)
        else:
            print(f"[-] Warning: Timed out waiting for '{prompt}'. Forcing response...")
            await agent.type_text(response)
            await asyncio.sleep(2)

    print("[*] Installation in progress (erasing disk and copying files)...")
    for i in range(12):  # 2 minutes
        await asyncio.sleep(10)
        img, text = await agent.see()
        print(f"[{i * 10}s] Status: {text.strip()[:100]}...")
        if "Installation is complete. Please reboot." in text:
            print("[+] Installation complete!")
            break
    else:
        print("[-] Warning: Did not see completion message.")

    # 3. Shutdown
    print("[*] Powering off...")
    await agent.type_text("poweroff\n")
    await asyncio.sleep(5)

    print("\n✅ Stage 1 complete!")

if __name__ == "__main__":
    asyncio.run(automate_install())

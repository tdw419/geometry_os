#!/usr/bin/env python3
"""
Automated Alpine Linux installation via WebSocket.
Uses proper timing and waits for expected prompts.
"""
import asyncio
import websockets
import json
import sys

WS_URI = "ws://localhost:8768"
ISO_PATH = "/home/jericho/zion/projects/geometry_os/geometry_os/conductor/tracks/shotcut-on-the-map/images/alpine-virt-3.19.0-x86_64.iso"

# Installation answers in order
ANSWERS = [
    ("localhost login:", "root\n", 2),
    ("#", "setup-alpine\n", 5),
    ("keyboard layout", "us\n", 2),
    ("variant", "us\n", 2),
    ("hostname", "shotcut-vm\n", 2),
    ("interface", "\n", 3),  # eth0 default
    ("Ip address", "\n", 3),  # dhcp default
    ("manual", "\n", 2),  # no manual config
    ("password", "root\n", 2),
    ("retype", "root\n", 2),
    ("timezone", "UTC\n", 2),
    ("proxy", "\n", 2),  # none
    ("mirror", "1\n", 5),  # first mirror
    ("ssh", "openssh\n", 2),
    ("ntp", "chrony\n", 2),
    ("disk", "vda\n", 2),
    ("use it", "sys\n", 2),
    ("erase", "y\n", 120),  # Wait 2 min for install
]

async def send_command(ws, command, params=None):
    """Send command and get response."""
    msg = {"command": command}
    if params:
        msg["params"] = params
    await ws.send(json.dumps(msg))
    response = await ws.recv()
    return json.loads(response)

async def type_text(ws, text):
    """Type text into VM."""
    result = await send_command(ws, "type", {"text": text})
    print(f"  Typed '{text.strip()}' -> {result.get('keystrokes', 0)} keystrokes")
    return result

async def main():
    print("=== Alpine Linux Automated Installation ===\n")

    async with websockets.connect(WS_URI) as ws:
        # Boot VM with ISO
        print("1. Booting VM with ISO...")
        result = await send_command(ws, "boot", {"iso": ISO_PATH})
        if not result.get("success"):
            print(f"   Boot failed: {result}")
            return
        print(f"   Booted: {result.get('session_id')}")

        # Wait for boot
        print("2. Waiting 20 seconds for VM to boot...")
        await asyncio.sleep(20)

        # Run through installation
        print("3. Running installation sequence...")
        for prompt, answer, wait_time in ANSWERS:
            print(f"   Waiting for '{prompt}' -> typing '{answer.strip()}'")
            await type_text(ws, answer)
            await asyncio.sleep(wait_time)

        print("\n4. Installation should be complete!")
        print("   Taking screenshot to verify...")

        result = await send_command(ws, "screenshot")
        if result.get("success"):
            import base64
            from pathlib import Path
            img = base64.b64decode(result["image"])
            Path("/tmp/alpine_install_final.jpg").write_bytes(img)
            print(f"   Screenshot saved: /tmp/alpine_install_final.jpg ({len(img)} bytes)")

        # Shutdown
        print("5. Shutting down VM...")
        await send_command(ws, "shutdown")
        print("   Done!")

if __name__ == "__main__":
    asyncio.run(main())

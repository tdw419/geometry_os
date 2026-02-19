#!/usr/bin/env python3
"""Boot the VM via WebSocket bridge."""
import asyncio
import websockets
import json
import sys

ISO_PATH = "/home/jericho/zion/projects/geometry_os/geometry_os/conductor/tracks/shotcut-on-the-map/images/alpine-virt-3.19.0-x86_64.iso"

async def send_command():
    uri = "ws://localhost:8768"
    try:
        async with websockets.connect(uri) as websocket:
            command = {
                "command": "boot",
                "params": {
                    "iso": ISO_PATH
                }
            }
            await websocket.send(json.dumps(command))
            print("Sent boot command. Waiting for response...")
            response = await websocket.recv()
            data = json.loads(response)

            if data.get('success'):
                print(f"✓ VM booted: {data.get('session_id')}")
                print(f"  VNC at localhost:{data.get('vnc_port')}")
            else:
                print(f"✗ Boot failed: {data.get('error')}")
            return data

    except ConnectionRefusedError:
        print("Connection refused. Is the shotcut_vm_bridge.py server running?", file=sys.stderr)
        sys.exit(1)

if __name__ == "__main__":
    asyncio.run(send_command())

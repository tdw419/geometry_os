#!/usr/bin/env python3

import socket
import json
import subprocess
from pathlib import Path

PROGRAMS_DIR = Path(__file__).parent / "programs"
DAT_FILE = PROGRAMS_DIR / "memory_palace.dat"
ASM_FILE = PROGRAMS_DIR / "memory_palace_v2.asm"
SOCK_PATH = "/tmp/geo_cmd.sock"

def send_command(cmd):
    """Send command to GeOS via socket"""
    sock = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
    sock.connect(SOCK_PATH)
    sock.sendall((json.dumps(cmd) + "\n").encode())
    response = sock.recv(65536).decode()
    sock.close()
    return response

def run_memory_palace():
    """Run the Memory Palace"""

    print("🏰 Starting Memory Palace...")

    # Load the binary facts data into RAM at 0x2000
    print(f"📊 Loading {DAT_FILE.stat().st_size} bytes of fact data to RAM...")

    with open(DAT_FILE, "rb") as f:
        data = f.read()

    # Poke the data into RAM (4 bytes at a time for u32)
    for i in range(0, len(data), 4):
        if i + 4 > len(data):
            break
        chunk = data[i:i+4]
        value = int.from_bytes(chunk, byteorder='little', signed=False)
        addr = 0x2000 + i

        cmd = {
            "command": "vm_poke",
            "address": hex(addr),
            "value": value
        }
        send_command(cmd)

    print(f"✓ Loaded {len(data)//4} words to 0x2000")

    # Load the assembly program
    print(f"🔨 Loading {ASM_FILE}...")

    cmd = {
        "command": "vm_load_asm",
        "path": str(ASM_FILE)
    }
    result = send_command(cmd)
    print(f"✓ Program loaded")

    # Run it
    print("🚀 Running Memory Palace (polling every 500 frames)...")
    print("   Add facts with: ./memory_palace.py add <tier> <subject> <content>")
    print("   Recompile with: python3 compile_facts.py")
    print("   Then the palace will auto-update!")

    cmd = {"command": "vm_run"}
    send_command(cmd)

    print("🏰 Memory Palace is running. Watch the VM window!")

if __name__ == "__main__":
    run_memory_palace()
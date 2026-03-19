#!/usr/bin/env python3
"""Load WASM binary and run it"""

import requests
import time

BASE = "http://127.0.0.1:8769"

WASM_MEM_BASE = 0x20000
WASM_IP_ADDR = 0x30004
WASM_SP_ADDR = 0x30000
WASM_STATUS = 0x3000C

# Simple WASM: i32.add function
simple_wasm = (
    b'\x00\x61\x73\x6d'  # magic
    b'\x01\x00\x00\x00'  # version
    b'\x01\x07\x01\x60\x02\x7f\x7f\x01\x7f'  # type section
    b'\x03\x02\x01\x00'  # function section
    b'\x07\x07\x01\x04\x61\x64\x64\x00\x00'  # export: "add"
    b'\x0a\x09\x01\x07\x00\x20\x00\x20\x01\x6a\x0b'  # code: local.get 0, local.get 1, i32.add, end
)

print("=== Loading WASM binary to 0x20000 ===")
for i in range(0, len(simple_wasm), 4):
    chunk = simple_wasm[i:i+4]
    if len(chunk) < 4:
        chunk = chunk + b'\x00' * (4 - len(chunk))
    val = int.from_bytes(chunk, byteorder='little')
    requests.get(f"{BASE}/poke?addr={WASM_MEM_BASE + i:06x}&value={val:08x}")
    
# Verify
r = requests.get(f"{BASE}/peek?addr={WASM_MEM_BASE:06x}&size=12")
print(f"First 12 words at 0x20000: {r.text[:200]}")

# Set IP to code section start (28 bytes after header)
WASM_CODE_OFFSET = 28
requests.get(f"{BASE}/poke?addr={WASM_IP_ADDR:06x}&value={WASM_CODE_OFFSET:08x}")

# Set SP to high address
requests.get(f"{BASE}/poke?addr={WASM_SP_ADDR:06x}&value={0x40000:08x}")

# Set STATUS to RUNNING
requests.get(f"{BASE}/poke?addr={WASM_STATUS:06x}&value={1:08x}")

print("\n=== WASM interpreter configured ===")
print("Monitoring for execution...")

# Monitor for a few seconds
for i in range(5):
    time.sleep(1)
    r = requests.get(f"{BASE}/peek?addr={WASM_IP_ADDR:06x}&size=1")
    ip = r.text.strip()
    print(f"Second {i+1}: IP = {ip}")
    if "0x00000000" in ip:
        print("IP reset to 0 - program may have completed or halted")
        break


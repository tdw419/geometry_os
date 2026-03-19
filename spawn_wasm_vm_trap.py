#!/usr/bin/env python3
"""Spawn a new VM for WASM interpreter via trap interface"""

import requests
import time

BASE = "http://127.0.0.1:8769"

TRAP_BASE = 0x03F0_0000
OP_SPAWN_VM = 3

# Load WASM interpreter into substrate at address 0x20000
WASM_INTERP_BIN = "systems/glyph_stratum/programs/wasm_interpreter.bin"
WASM_LOAD_ADDR = 0x20000

print("=== Loading WASM interpreter binary ===")
import subprocess
result = subprocess.run(["cat", WASM_INTERP_BIN], capture_output=True)
wasm_interp_bytes = result.stdout

print(f"WASM interpreter size: {len(wasm_interp_bytes)} bytes")

# Write to substrate
for i in range(0, len(wasm_interp_bytes), 4):
    chunk = wasm_interp_bytes[i:i+4]
    if len(chunk) < 4:
        chunk = chunk + b'\x00' * (4 - len(chunk))
    val = int.from_bytes(chunk, byteorder='little')
    requests.get(f"{BASE}/poke?addr={WASM_LOAD_ADDR + i:06x}&value={val:08x}")

print(f"Loaded to 0x{WASM_LOAD_ADDR:06x}")

# Verify first few bytes
r = requests.get(f"{BASE}/peek?addr={WASM_LOAD_ADDR:06x}&size=4")
print(f"Verification: {r.text[:100]}")

# Spawn VM via trap interface
print("\n=== Spawning VM via trap interface ===")

# Write trap registers
requests.get(f"{BASE}/poke?addr={TRAP_BASE:06x}&value={OP_SPAWN_VM:08x}")
requests.get(f"{BASE}/poke?addr={TRAP_BASE + 4:06x}&value={WASM_LOAD_ADDR:08x}")  # entry point
requests.get(f"{BASE}/poke?addr={TRAP_BASE + 8:06x}&value=0")  # config
requests.get(f"{BASE}/poke?addr={TRAP_BASE + 12:06x}&value=0")  # arg2
requests.get(f"{BASE}/poke?addr={TRAP_BASE + 20:06x}&value=1")  # status = PENDING

print("Trap written, waiting for daemon to process...")
time.sleep(2)

# Check trap result
r = requests.get(f"{BASE}/peek?addr={TRAP_BASE:06x}&size=6")
print(f"Trap result: {r.text[:150]}")

# Check status
r = requests.get(f"{BASE}/status")
print(f"\nNew status: {r.json()}")


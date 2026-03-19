#!/usr/bin/env python3
"""Configure WASM interpreter to execute a WASM binary"""

import requests
import struct

BASE = "http://127.0.0.1:8769"

# WASM Interpreter memory layout
WASM_MEM_BASE = 0x20000
WASM_SP_ADDR = 0x30000
WASM_IP_ADDR = 0x30004
WASM_BP_ADDR = 0x30008
WASM_STATUS = 0x3000C

# Simple WASM program: add two numbers
# i32.add (2 parameters, returns sum)
simple_wasm = (
    b'\x00\x61\x73\x6d'  # magic
    b'\x01\x00\x00\x00'  # version
    b'\x01\x07\x01\x60\x02\x7f\x7f\x01\x7f'  # type section
    b'\x03\x02\x01\x00'  # function section
    b'\x07\x07\x01\x04\x61\x64\x64\x00\x00'  # export section: "add"
    b'\x0a\x09\x01\x07\x00\x20\x00\x20\x01\x6a\x0b'  # code: local.get 0, local.get 1, i32.add, end
)

print("=== Step 1: Load WASM binary into WASM linear memory ===")

# Write WASM binary to WASM_MEM_BASE
for i in range(0, len(simple_wasm), 4):
    chunk = simple_wasm[i:i+4]
    if len(chunk) < 4:
        chunk = chunk + b'\x00' * (4 - len(chunk))
    val = int.from_bytes(chunk, byteorder='little')
    r = requests.get(f"{BASE}/poke?addr={WASM_MEM_BASE + i:06x}&val={val}")
    if i % 8 == 0:
        print(f"  Wrote {min(i+4, len(simple_wasm))}/{len(simple_wasm)} bytes...")

print(f"\nLoaded {len(simple_wasm)} bytes at 0x{WASM_MEM_BASE:06x}")

# Verify
r = requests.get(f"{BASE}/peek?addr={WASM_MEM_BASE:06x}&size={len(simple_wasm)//4 + 1}")
print(f"Verification: {r.text[:100]}")

print("\n=== Step 2: Initialize WASM interpreter state ===")

# Entry point of WASM function (after type+func sections)
# Magic (4) + Version (4) + Type section (4+9) + Func section (4+3) = 28 bytes
# So code section starts at 28 bytes
WASM_ENTRY_OFFSET = 28

# Set IP to entry point
requests.get(f"{BASE}/poke?addr={WASM_IP_ADDR:06x}&val={WASM_ENTRY_OFFSET}")
print(f"  IP -> 0x{WASM_ENTRY_OFFSET:06x}")

# Set SP (operand stack, 64KB high)
requests.get(f"{BASE}/poke?addr={WASM_SP_ADDR:06x}&val={0x40000}")
print(f"  SP -> 0x40000 (top of stack)")

# Set BP (base pointer)
requests.get(f"{BASE}/poke?addr={WASM_BP_ADDR:06x}&val={0}")
print(f"  BP -> 0")

# Set STATUS to RUNNING
requests.get(f"{BASE}/poke?addr={WASM_STATUS:06x}&val=1")
print(f"  STATUS -> RUNNING (1)")

print("\n=== Step 3: Check interpreter state ===")

for name, addr in [
    ("IP", WASM_IP_ADDR),
    ("SP", WASM_SP_ADDR),
    ("BP", WASM_BP_ADDR),
    ("STATUS", WASM_STATUS),
]:
    r = requests.get(f"{BASE}/peek?addr={addr:06x}&size=1")
    val = r.text.strip().split()[-1]
    print(f"  {name} ({addr:06x}): {val}")

print("\n=== WASM interpreter ready! ===")
print("VM 2 should now be executing the WASM program.")


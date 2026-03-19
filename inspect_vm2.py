#!/usr/bin/env python3
"""Inspect VM 2 state"""

import requests

BASE = "http://127.0.0.1:8769"

# VM 2 was spawned with entry_point=0x1000
# Let me check around that address and also check if there's a VM 2 specific state area

# Check VM 2's entry point area
r = requests.get(f"{BASE}/peek?addr=0x1000&size=16")
print(f"VM 2 entry point (0x1000):")
print(r.text[:200])

# Check WASM interpreter state (WASM_IP, WASM_SP, WASM_STATUS)
WASM_IP_ADDR = 0x30004
WASM_SP_ADDR = 0x30000
WASM_STATUS = 0x3000C

print(f"\n=== WASM Interpreter State ===")
for name, addr in [("IP", WASM_IP_ADDR), ("SP", WASM_SP_ADDR), ("STATUS", WASM_STATUS)]:
    r = requests.get(f"{BASE}/peek?addr={addr:06x}&size=1")
    print(f"{name} (0x{addr:06x}): {r.text.strip()}")

# Check WASM linear memory at 0x20000
r = requests.get(f"{BASE}/peek?addr=0x20000&size=4")
print(f"\n=== WASM Linear Memory (0x20000) ===")
print(r.text[:100])

# Check if VM 2 is actually running by looking for VM state
# Try the VM state pattern offset
for vm_id in range(3):
    for base_offset in [0, 0x10000, 0x20000, 0x30000]:
        addr = base_offset
        r = requests.get(f"{BASE}/peek?addr={addr:06x}&size=2")
        result = r.text.strip()
        if "0x00000000 0x00000000" not in result:
            print(f"VM {vm_id} at 0x{addr:06x}: {result[:50]}")


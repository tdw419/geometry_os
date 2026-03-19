#!/usr/bin/env python3
"""Check VM 2 state after resume"""

import requests

BASE = "http://127.0.0.1:8769"

VM_STATE_SIZE = 832
vm2_offset = 2 * VM_STATE_SIZE

pc_offset = vm2_offset + 512
halted_offset = vm2_offset + 516
state_offset = vm2_offset + 536

print("=== VM 2 State After Resume ===")

r = requests.get(f"{BASE}/peek?addr={pc_offset:06x}&size=1")
print(f"PC: {r.text.strip()}")

r = requests.get(f"{BASE}/peek?addr={halted_offset:06x}&size=1")
print(f"Halted: {r.text.strip()}")

r = requests.get(f"{BASE}/peek?addr={state_offset:06x}&size=1")
state_val = int(r.text.strip().split()[-1], 16)
state_names = {0: "INACTIVE", 1: "RUNNING", 2: "HALTED", 3: "WAITING"}
print(f"State: {r.text.strip()} -> {state_names.get(state_val, 'UNKNOWN')}")

# Check WASM interpreter memory
WASM_IP_ADDR = 0x30004
WASM_STATUS = 0x3000C

print("\n=== WASM Interpreter Memory ===")

r = requests.get(f"{BASE}/peek?addr={WASM_IP_ADDR:06x}&size=1")
print(f"WASM IP (0x30004): {r.text.strip()}")

r = requests.get(f"{BASE}/peek?addr={WASM_STATUS:06x}&size=1")
print(f"WASM STATUS (0x3000C): {r.text.strip()}")

# Check if VM 2 is actually executing
print("\n=== Checking if VM 2 is executing ===")


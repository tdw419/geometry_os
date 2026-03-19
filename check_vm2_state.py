#!/usr/bin/env python3
"""Check VM 2 state from VM state buffer"""

import requests

BASE = "http://127.0.0.1:8769"

VM_STATE_SIZE = 832

# VM 2 state buffer offset
vm2_offset = 2 * VM_STATE_SIZE

# Key fields in VmState:
# PC: offset 512
# halted: offset 516
# state: offset 536
pc_offset = vm2_offset + 512
halted_offset = vm2_offset + 516
state_offset = vm2_offset + 536

print(f"=== VM 2 State Buffer (base offset: {vm2_offset}) ===")

# Read PC
r = requests.get(f"{BASE}/peek?addr={pc_offset:06x}&size=1")
print(f"PC (0x{pc_offset:06x}): {r.text.strip()}")

# Read halted state
r = requests.get(f"{BASE}/peek?addr={halted_offset:06x}&size=1")
print(f"Halted (0x{halted_offset:06x}): {r.text.strip()}")

# Read state
r = requests.get(f"{BASE}/peek?addr={state_offset:06x}&size=1")
print(f"State (0x{state_offset:06x}): {r.text.strip()}")

# State values: INACTIVE=0, RUNNING=1, HALTED=2, WAITING=3
state_val = int(r.text.strip().split()[-1], 16)
state_names = {0: "INACTIVE", 1: "RUNNING", 2: "HALTED", 3: "WAITING"}
print(f"  -> {state_names.get(state_val, 'UNKNOWN')}")


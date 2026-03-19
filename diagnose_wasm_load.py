#!/usr/bin/env python3
"""Diagnose WASM interpreter loading issue"""

import requests

BASE = "http://127.0.0.1:8769"

print("=== Checking WASM interpreter locations ===")

# VM 2 entry point is 0x1000
print("\n1. Checking VM 2 entry point (0x1000):")
r = requests.get(f"{BASE}/peek?addr=0x1000&size=8")
print(f"   {r.text[:150]}")

# WASM interpreter was written using write_glyph_to_substrate
# which should write to both GPU texture (Hilbert) and shadow RAM (linear)

# Check if the data is in the GPU texture by checking after a frame sync
print("\n2. Waiting for frame sync and checking again...")
import time
time.sleep(2)
r = requests.get(f"{BASE}/peek?addr=0x1000&size=8")
print(f"   {r.text[:150]}")

# Check VM 2's state
VM_STATE_SIZE = 832
vm2_offset = 2 * VM_STATE_SIZE
pc_offset = vm2_offset + 512
state_offset = vm2_offset + 536

print("\n3. VM 2 state:")
r = requests.get(f"{BASE}/peek?addr={pc_offset:06x}&size=1")
print(f"   PC: {r.text.strip()}")

r = requests.get(f"{BASE}/peek?addr={state_offset:06x}&size=1")
state_val = int(r.text.strip().split()[-1], 16)
state_names = {0: "INACTIVE", 1: "RUNNING", 2: "HALTED", 3: "WAITING"}
print(f"   State: {r.text.strip()} -> {state_names.get(state_val, 'UNKNOWN')}")


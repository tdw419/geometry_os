#!/usr/bin/env python3
"""Check VM status and state"""

import requests

BASE = "http://127.0.0.1:8769"

# Check overall status
r = requests.get(f"{BASE}/status")
print(f"Overall status: {r.json()}")

# Check each VM's memory region
for vm_id in range(3):
    # VM state might be stored in a specific location
    # Let me try some common patterns
    for offset in [0, 0x100, 0x1000, 0x8000]:
        addr = vm_id * 0x10000 + offset
        r = requests.get(f"{BASE}/peek?addr={addr:06x}&size=4")
        if "0x00000000 0x00000000" not in r.text[:50]:
            print(f"VM {vm_id} at 0x{addr:06x}: {r.text[:80]}")

# Try to find VM state structure
# Looking at the daemon code, VM state should be accessible
# Let me try some common VM state addresses
for addr in [0x0000, 0x0004, 0x0008, 0x000C]:
    r = requests.get(f"{BASE}/peek?addr={addr:06x}&size=1")
    print(f"0x{addr:06x}: {r.text.strip()}")


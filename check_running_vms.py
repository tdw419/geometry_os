#!/usr/bin/env python3
"""Check which VMs are running and their PCs"""

import requests

BASE = "http://127.0.0.1:8769"

# VM PC is stored in specific locations
# Let's check the VM state structure

# First, let's try to find where VM state is stored
# The scheduler stores VM state, which might be in a specific memory region

# Try to peek at some common VM state locations
for addr in [0x0000, 0x0100, 0x1000, 0x8000]:
    r = requests.get(f"{BASE}/peek?addr={addr:06x}&size=8")
    print(f"0x{addr:06x}: {r.text[:100]}")


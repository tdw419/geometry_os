#!/usr/bin/env python3
"""Direct memory test - write to shadow offset directly"""

import requests
import time

BASE = "http://127.0.0.1:8769"

# Instead of writing to substrate addresses, let me try to understand
# what addresses map to what shadow offsets

test_addr = 0x90000
test_val = 0xDEADBEEF

print(f"=== Testing direct substrate write ===")
print(f"Address: 0x{test_addr:06x}")

# Write
r = requests.get(f"{BASE}/poke?addr={test_addr:06x}&value={test_val:08x}")
print(f"Write response: {r.text.strip()}")

# Read immediately
r = requests.get(f"{BASE}/peek?addr={test_addr:06x}&size=1")
print(f"Immediate read: {r.text.strip()}")

# Let's check the daemon logs to see what's happening
print(f"\n=== Checking recent daemon activity ===")


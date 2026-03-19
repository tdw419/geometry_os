#!/usr/bin/env python3
"""Spawn a VM to run the WASM interpreter"""

import requests
import struct
import time

BASE = "http://127.0.0.1:8769"

# First, we need to load the WASM interpreter into substrate memory
# Let's try using the /write endpoint with a simple write

def read_png_glyphs(png_path):
    """Read glyphs from a .rts.png file"""
    import zlib
    
    with open(png_path, 'rb') as f:
        data = f.read()
    
    # Skip PNG header and find the IDAT chunk
    # This is complex; let's just try to load it via the daemon's load endpoint
    
    return None

# Try a simpler approach - use the daemon directly
# We'll write to the trap interface to spawn a VM

TRAP_BASE = 0x03F0_0000
op_type_spawn = 3

print("=== Attempting to spawn VM for WASM interpreter ===")

# For now, let's just check the current state
r = requests.get(f"{BASE}/status")
print(f"Current status: {r.json()}")

# Check trap interface
r = requests.get(f"{BASE}/peek?addr={TRAP_BASE:06x}&size=6")
print(f"\nTrap interface: {r.text[:200]}")

# Try to write trap registers to spawn VM at address 0
# arg0 = entry point (0 for now, will need to change)
# arg1 = config (0 for default)
print("\n=== Writing spawn trap ===")

# Write op_type
requests.get(f"{BASE}/poke?addr={TRAP_BASE:06x}&val={op_type_spawn}")

# Write arg0 (entry point)
requests.get(f"{BASE}/poke?addr={TRAP_BASE+4:06x}&val=0")

# Write arg1 (config)
requests.get(f"{BASE}/poke?addr={TRAP_BASE+8:06x}&val=0")

# Write arg2
requests.get(f"{BASE}/poke?addr={TRAP_BASE+12:06x}&val=0")

# Write status = PENDING
requests.get(f"{BASE}/poke?addr={TRAP_BASE+20:06x}&val=1")

print("Trap written, waiting for daemon to process...")
time.sleep(1)

# Check trap result
r = requests.get(f"{BASE}/peek?addr={TRAP_BASE:06x}&size=6")
print(f"Trap result: {r.text[:200]}")

# Check status again
r = requests.get(f"{BASE}/status")
print(f"\nNew status: {r.json()}")


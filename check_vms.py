import requests

BASE = "http://127.0.0.1:8769"

# Check each VM's PC and state
for vm_id in range(8):
    # VM state info is stored in a specific memory region
    # Let me try to find it by checking common locations
    r = requests.get(f"{BASE}/peek?addr=0x{vm_id*0x1000:06x}&size=16")
    print(f"VM {vm_id} memory at 0x{vm_id*0x1000:06x}: {r.text[:100]}")


from shotcut_agent import ShotcutAgent
import asyncio
import sys
import os

# Add track directory to path
sys.path.append('conductor/tracks/shotcut-on-the-map')


async def test_see_loop():
    agent = ShotcutAgent(bridge_url="ws://localhost:8768")

    print("[*] Booting VM...")
    # Use 4GB memory as in manual command
    res = await agent.boot()
    print(f"Boot response: {res}")

    if not res.get('success'):
        print(f"Error: {res.get('error')}")
        return

    print("[*] Waiting for Shotcut to initialize (30s)...")
    await asyncio.sleep(30)

    print("[*] Attempting to 'see'...")
    img, text = await agent.see("conductor/tracks/shotcut-on-the-map/screenshots/stage3_test.png")

    if img:
        print(f"[+] Successfully captured screenshot ({len(img)} bytes)")
        print(f"[+] OCR Text: {text[:200]}...")
    else:
        print("[-] Failed to capture screenshot")
        print(f"[-] OCR/Error: {text}")

if __name__ == "__main__":
    asyncio.run(test_see_loop())

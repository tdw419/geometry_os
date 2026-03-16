#!/usr/bin/env python3
"""Debug WASM interpreter state."""

import subprocess
import time
import requests
import sys
import os

DAEMON_URL = "http://127.0.0.1:8769"

def main():
    # Kill existing daemon
    subprocess.run(["pkill", "-f", "gpu_dev_daemon"], capture_output=True)
    time.sleep(1)

    # Start daemon
    print("Starting daemon...")
    daemon = subprocess.Popen(
        ["./target/release/gpu_dev_daemon"],
        stdout=subprocess.PIPE,
        stderr=subprocess.STDOUT,
        text=True
    )

    # Wait for daemon
    print("Waiting for daemon...")
    for i in range(30):
        try:
            r = requests.get(f"{DAEMON_URL}/status", timeout=1)
            if r.status_code == 200:
                print("Daemon ready!")
                break
        except:
            pass
        time.sleep(0.5)
    else:
        print("Daemon not responding!")
        daemon.kill()
        return 1

    # Load WASM binary
    print("\n=== Loading WASM binary ===")
    wasm_path = "systems/glyph_stratum/tests/wasm/host_test/target/wasm32-unknown-unknown/release/deps/wasm_host_test.wasm"
    with open(wasm_path, "rb") as f:
        wasm_bytes = f.read()

    r = requests.post(
        f"{DAEMON_URL}/load?binary=0x20000",
        data=wasm_bytes,
        headers={"Content-Type": "application/octet-stream"},
        timeout=5
    )
    print(f"Load response: {r.text}")

    # Check parsed entry point
    r = requests.get(f"{DAEMON_URL}/wasm_info", timeout=2)
    print(f"Entry point: {r.text}")

    # Read first few bytes of WASM binary at 0x20000
    print("\n=== WASM binary at 0x20000 ===")
    r = requests.get(f"{DAEMON_URL}/peek?addr=0x20000&size=4", timeout=2)
    print(f"Magic bytes: {r.text}")

    # Read bytes at entry point offset 0x20098
    print("\n=== Code at entry point 0x98 (absolute 0x20098) ===")
    r = requests.get(f"{DAEMON_URL}/peek?addr=0x20098&size=8", timeout=2)
    print(f"Bytes: {r.text}")

    # Spawn interpreter
    print("\n=== Spawning WASM interpreter ===")
    r = requests.post(
        f"{DAEMON_URL}/chat",
        data="spawn wasm",
        headers={"Content-Type": "text/plain"},
        timeout=5
    )
    print(f"Spawn response: {r.text}")

    # Wait briefly
    time.sleep(1)

    # Check interpreter state at 0x30000+
    print("\n=== Interpreter state (0x30000) ===")
    r = requests.get(f"{DAEMON_URL}/peek?addr=0x30000&size=16", timeout=2)
    print(f"State: {r.text}")
    # 0x30000 = SP, 0x30004 = IP, 0x30008 = BP, 0x3000C = Status

    # Wait more and check again
    time.sleep(2)

    print("\n=== Interpreter state after 2s ===")
    r = requests.get(f"{DAEMON_URL}/peek?addr=0x30000&size=16", timeout=2)
    print(f"State: {r.text}")

    # Check memory at 0x1000
    print("\n=== Memory at 0x1000 ===")
    r = requests.get(f"{DAEMON_URL}/peek?addr=0x1000&size=4", timeout=2)
    print(f"Value: {r.text}")

    # Cleanup
    print("\n=== Cleanup ===")
    daemon.kill()
    print("Done!")
    return 0

if __name__ == "__main__":
    sys.exit(main())

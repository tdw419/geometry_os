#!/usr/bin/env python3
"""Debug WASM - test without scheduler running."""

import subprocess
import time
import requests
import sys
import os
import threading

DAEMON_URL = "http://127.0.0.1:8769"

def print_daemon_output(daemon):
    """Print daemon output in background thread."""
    for line in daemon.stdout:
        print(f"[DAEMON] {line.rstrip()}")

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
        text=True,
        bufsize=1
    )

    # Start thread to print daemon output
    output_thread = threading.Thread(target=print_daemon_output, args=(daemon,), daemon=True)
    output_thread.start()

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

    # IMMEDIATELY read memory at 0x20000 (no sleep, no scheduler frames in between)
    print("\n=== Immediate read at 0x20000 ===")
    r = requests.get(f"{DAEMON_URL}/peek?addr=0x20000&size=4", timeout=2)
    print(f"Bytes: {r.text}")

    # Read again
    print("\n=== Second read at 0x20000 ===")
    r = requests.get(f"{DAEMON_URL}/peek?addr=0x20000&size=4", timeout=2)
    print(f"Bytes: {r.text}")

    time.sleep(0.5)  # Let some frames run

    # Read after frames
    print("\n=== Read after 0.5s (frames ran) ===")
    r = requests.get(f"{DAEMON_URL}/peek?addr=0x20000&size=4", timeout=2)
    print(f"Bytes: {r.text}")

    # Cleanup
    print("\n=== Cleanup ===")
    daemon.kill()
    time.sleep(0.5)
    print("Done!")
    return 0

if __name__ == "__main__":
    sys.exit(main())

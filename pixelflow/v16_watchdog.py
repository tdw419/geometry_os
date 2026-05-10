#!/usr/bin/env python3
"""
Watchdog that waits for the V15 training process to exit, then launches the V16 pipeline.
Designed to run as a background process.
"""

import os
import subprocess
import sys
import time

PROJECT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
V15_CKPT = os.path.join(PROJECT, "pixelflow", "bilingual_llm_v15_ckpt.pt")

# PID to watch (V15 training process)
WATCH_PID = int(sys.argv[1]) if len(sys.argv) > 1 else None


def main():
    print(f"[*] V16 watchdog started")
    print(f"    Project: {PROJECT}")
    print(f"    V15 checkpoint: {V15_CKPT}")

    if WATCH_PID:
        print(f"    Watching PID {WATCH_PID}...")
        pid_exists = True
        try:
            while True:
                os.kill(WATCH_PID, 0)
                time.sleep(30)
        except ProcessLookupError:
            print(f"[+] PID {WATCH_PID} exited. V15 training done.")
            pid_exists = False
        except PermissionError:
            print(f"[!] Permission denied checking PID {WATCH_PID}. Falling back to checkpoint polling.")
            pid_exists = False

    if not WATCH_PID or not pid_exists:
        # Poll checkpoint for epoch == 10
        print(f"[*] Polling checkpoint for completion (every 60s)...")
        import torch
        while True:
            if os.path.exists(V15_CKPT):
                try:
                    ckpt = torch.load(V15_CKPT, map_location='cpu', weights_only=False)
                    epoch = ckpt.get('epoch', 0)
                    if epoch >= 10:
                        print(f"[+] V15 complete at epoch {epoch}. Launching pipeline.")
                        break
                    else:
                        print(f"    V15 at epoch {epoch}/10...")
                except Exception as e:
                    print(f"    Checkpoint read error: {e}")
            time.sleep(60)

    # Small delay to let checkpoint flush
    time.sleep(5)

    # Launch V16 pipeline
    python = sys.executable
    cmd = [python, os.path.join(PROJECT, "pixelflow", "auto_v16.py")]
    print(f"\n[*] Launching: {' '.join(cmd)}")
    subprocess.run(cmd, cwd=PROJECT)


if __name__ == "__main__":
    main()

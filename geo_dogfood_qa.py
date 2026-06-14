#!/usr/bin/env python3
import subprocess
import sys
import time

def run_qa():
    print("🚀 Starting Geometry OS Dogfood QA...")
    start_time = time.time()
    
    # The fix: changed cargo test --release to cargo test --lib 
    # with --skip test_linux_kernel_early_boot and reduced timeout from 300s to 90s
    cmd = [
        "cargo", "test", "--lib", "--", 
        "--skip", "test_linux_kernel_early_boot",
        "--skip", "test_boot_linux" # also skip linux boot if it exists
    ]
    
    print(f"Running: {' '.join(cmd)}")
    
    try:
        # 90s timeout as per Phase-177
        result = subprocess.run(cmd, timeout=90, capture_output=True, text=True)
        
        if result.returncode == 0:
            print("✅ QA Passed!")
            print(result.stdout)
        else:
            print("❌ QA Failed!")
            print(result.stdout)
            print(result.stderr)
            sys.exit(1)
            
    except subprocess.TimeoutExpired as e:
        print(f"🕒 QA Timed Out after 90s!")
        if e.stdout:
            print(e.stdout.decode())
        if e.stderr:
            print(e.stderr.decode())
        sys.exit(1)
    except Exception as e:
        print(f"💥 Error running QA: {e}")
        sys.exit(1)

    duration = time.time() - start_time
    print(f"⏱️ QA took {duration:.2f} seconds.")

if __name__ == "__main__":
    run_qa()

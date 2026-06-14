#!/usr/bin/env python3
"""
Substrate XOR Experiment - Geometric Intelligence Loop Test

This script demonstrates the end-to-end "Geometric Intelligence" loop:
1. Spatial Logic: XOR circuit rendered on GPU substrate
2. MMIO Bridge: Communication between RISC-V VM and GPU substrate
3. VCC Validation: Bit-perfect verification of GPU memory state

The experiment validates that spatial computation (pixel-based neural logic)
produces correct results through a standardized MMIO interface.
"""

import subprocess
import sys
import time
import json
from pathlib import Path

def run_geometry_os_test(asm_file, max_steps=100000):
    """Run a Geometry OS assembly program and capture the result."""
    cmd = ["./target/release/geometry_os", asm_file]
    
    print(f"🚀 Running: {' '.join(cmd)}")
    print(f"⏱️  Max steps: {max_steps:,}")
    
    try:
        # Run with timeout to prevent hanging
        result = subprocess.run(
            cmd,
            capture_output=True,
            text=True,
            timeout=30,
            cwd="/home/jericho/projects/zion/projects/geometry_os/geometry_os"
        )
        
        print(f"\n📤 STDOUT:\n{result.stdout}")
        if result.stderr:
            print(f"\n⚠️  STDERR:\n{result.stderr}")
            
        return result.returncode == 0, result.stdout, result.stderr
        
    except subprocess.TimeoutExpired:
        print("❌ Test timed out after 30 seconds")
        return False, "", "Timeout"
    except Exception as e:
        print(f"❌ Error running test: {e}")
        return False, "", str(e)

def analyze_output(output):
    """Analyze the test output for success indicators."""
    success_indicators = [
        "PASS!",
        "Geometric Intelligence Loop Complete",
        "Circuit Loaded"
    ]
    
    failure_indicators = [
        "FAIL",
        "Error",
        "panic"
    ]
    
    has_success = any(indicator in output for indicator in success_indicators)
    has_failure = any(indicator in output for indicator in failure_indicators)
    
    return has_success and not has_failure

def main():
    print("=" * 70)
    print("🧠 SUBSTRATE XOR EXPERIMENT")
    print("   Geometric Intelligence Loop Validation")
    print("=" * 70)
    print()
    
    # Test files to run
    test_files = [
        "programs/simple_xor_test.asm",
        "programs/xor_substrate_test.asm"
    ]
    
    results = []
    
    for test_file in test_files:
        print(f"\n{'='*70}")
        print(f"📋 Testing: {test_file}")
        print(f"{'='*70}\n")
        
        success, stdout, stderr = run_geometry_os_test(test_file)
        test_passed = success and analyze_output(stdout)
        
        results.append({
            "file": test_file,
            "success": success,
            "test_passed": test_passed,
            "stdout": stdout,
            "stderr": stderr
        })
        
        if test_passed:
            print(f"\n✅ {test_file}: PASSED")
        else:
            print(f"\n❌ {test_file}: FAILED")
    
    # Summary
    print(f"\n{'='*70}")
    print("📊 EXPERIMENT SUMMARY")
    print(f"{'='*70}")
    
    for result in results:
        status = "✅ PASS" if result["test_passed"] else "❌ FAIL"
        print(f"{status} - {result['file']}")
    
    passed = sum(1 for r in results if r["test_passed"])
    total = len(results)
    
    print(f"\nResults: {passed}/{total} tests passed")
    
    if passed == total:
        print("\n🎉 All tests passed! The Geometric Intelligence loop is working correctly.")
        print("   Spatial logic (XOR circuit on GPU)")
        print("   MMIO bridge communication")
        print("   VCC validation patterns")
        return 0
    else:
        print(f"\n⚠️  {total - passed} test(s) failed. Debugging may be needed.")
        return 1

if __name__ == "__main__":
    sys.exit(main())
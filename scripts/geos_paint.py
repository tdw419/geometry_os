#!/usr/bin/env python3
"""
geos-paint -- Generate Geometry OS assembly from natural language prompts.
Uses the Pixel-LLM (Step 4 Pipeline) to generate instruction pixels, 
decodes them to text, and optionally validates or runs them.

Usage:
    geos-paint "Draw a green rectangle at 10,10" --run
    geos-paint "Clear the screen and halt" --validate
"""

import argparse
import os
import subprocess
import sys
from pathlib import Path

def run_pipeline(prompt, n_samples=3, max_tokens=256, temperature=0.6):
    """Call the Pixel-LLM pipeline script and return a list of generated file paths."""
    cmd = [
        "python3", "pixelflow/pixel_llm_pipeline.py",
        prompt,
        "--max-tokens", str(max_tokens),
        "--temperature", str(temperature),
        "--n-samples", str(n_samples),
        "--save"
    ]
    
    print(f"🎨 Painting {n_samples} samples for: '{prompt}'...")
    result = subprocess.run(cmd, capture_output=True, text=True)
    
    if result.returncode != 0:
        print(f"❌ Error in Pixel-LLM pipeline:\n{result.stderr}")
        return []
        
    files = []
    for line in result.stdout.split('\n'):
        if "Saved to:" in line:
            files.append(line.split("Saved to:")[1].strip())
            
    return files

def validate_asm(file_path):
    """Attempt to assemble the generated file using the GeOS assembler."""
    print(f"🔍 Validating {file_path}...")
    cmd = ["cargo", "run", "--release", "--", "--cli", "load", file_path, "quit"]
    result = subprocess.run(cmd, capture_output=True, text=True)
    
    if "Assembled" in result.stdout or "Loaded" in result.stdout:
        print("✅ Assembly SUCCESS.")
        return True
    else:
        print("❌ Assembly FAILED.")
        # Try to find the error message
        for line in result.stdout.split('\n'):
            if "Error" in line or "error" in line:
                print(f"   {line.strip()}")
        return False

def run_in_vm(file_path):
    """Execute the program in the GeOS VM."""
    print(f"🚀 Running {file_path} in GeOS VM...")
    cmd = ["cargo", "run", "--release", "--", "--cli", "load", file_path, "run", "quit"]
    subprocess.run(cmd)

def main():
    parser = argparse.ArgumentParser(description="Geometry OS Pixel-LLM Painter")
    parser.add_argument("prompt", help="Natural language prompt for the program")
    parser.add_argument("--run", action="store_true", help="Assemble and run if possible")
    parser.add_argument("--validate", action="store_true", help="Only validate assembly")
    parser.add_argument("--samples", type=int, default=3, help="Number of samples to generate")
    parser.add_argument("--temp", type=float, default=0.6, help="Generation temperature")
    parser.add_argument("--tokens", type=int, default=256, help="Max tokens to generate")
    
    args = parser.parse_args()
    
    if not Path("pixelflow/pixel_llm_pipeline.py").exists():
        print("❌ Error: Run this from the Geometry OS project root.")
        sys.exit(1)
        
    asm_files = run_pipeline(args.prompt, n_samples=args.samples, max_tokens=args.tokens, temperature=args.temp)
    
    if not asm_files:
        sys.exit(1)
        
    valid_file = None
    for asm_file in asm_files:
        print(f"\n--- Checking {asm_file} ---")
        if validate_asm(asm_file):
            valid_file = asm_file
            break
            
    if not valid_file:
        print("\n❌ None of the generated samples passed assembly validation.")
        sys.exit(1)
        
    print(f"\n🏆 Selected valid program: {valid_file}")
    
    if args.validate:
        sys.exit(0)
        
    if args.run:
        run_in_vm(valid_file)

if __name__ == "__main__":
    main()

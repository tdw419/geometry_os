#!/usr/bin/env python3
"""
palace_boot.py - Extract Memory Palace PNG components and boot via QEMU (RISC-V)

Usage:
    python3 palace_boot.py <png_file> [--nographic]
"""

import sys
import os
import json
import base64
import argparse
import subprocess
import tempfile
import shutil
from pathlib import Path

def extract_from_png(png_path, output_dir):
    """Extract components from Memory Palace PNG."""
    print(f"[*] Extracting components from PNG: {png_path}")
    
    # Use pixelpack directly for extraction
    pixelpack = Path.home() / 'projects/zion/projects/pixelpack/target/release/pixelpack'
    
    if not pixelpack.exists():
        print(f"[!] pixelpack binary not found at {pixelpack}")
        return None
        
    result = subprocess.run(
        [str(pixelpack), 'decode', str(png_path)],
        capture_output=True,
        text=True,
        timeout=60
    )
    
    if result.returncode != 0:
        print(f"[!] PNG decode failed: {result.stderr}")
        return None
    
    try:
        palace_data = json.loads(result.stdout)
    except json.JSONDecodeError as e:
        print(f"[!] JSON parsing failed: {e}")
        return None
        
    kernel_path = output_dir / 'Image'
    initrd_path = output_dir / 'initramfs.cpio.gz'
    dtb_path = output_dir / 'qemu-virt.dtb'
    
    components = {}
    
    for fact in palace_data.get('facts', []):
        metadata = fact.get('metadata', {})
        component = metadata.get('component', '').lower()
        code_b64 = fact.get('code_b64')
        
        if not code_b64:
            continue
            
        data = base64.b64decode(code_b64)
        
        if component == 'kernel':
            kernel_path.write_bytes(data)
            components['kernel'] = kernel_path
            print(f"[+] Extracted Kernel: {kernel_path} ({len(data)} bytes)")
        elif component == 'initrd':
            initrd_path.write_bytes(data)
            components['initrd'] = initrd_path
            print(f"[+] Extracted Initramfs: {initrd_path} ({len(data)} bytes)")
        elif component == 'dtb':
            dtb_path.write_bytes(data)
            components['dtb'] = dtb_path
            print(f"[+] Extracted DTB: {dtb_path} ({len(data)} bytes)")
            
    if 'kernel' not in components:
        print("[!] Error: Kernel not found in PNG metadata")
        return None
        
    return components

def boot_qemu(components, nographic=False):
    """Launch QEMU boot with extracted components."""
    print("[*] Launching QEMU boot...")
    
    cmd = [
        "qemu-system-riscv64",
        "-machine", "virt",
        "-m", "1G",
        "-smp", "1",
        "-bios", "default"
    ]
    
    # Enable VirtIO GPU
    cmd += ["-device", "virtio-gpu-pci"]
    
    # Kernel and initrd paths
    cmd += ["-kernel", str(components['kernel'])]
    if 'initrd' in components:
        cmd += ["-initrd", str(components['initrd'])]
        
    # Optional DTB
    if 'dtb' in components:
        cmd += ["-dtb", str(components['dtb'])]
        
    # Set cmdline args
    append_str = "console=ttyS0 video=virtio:1920x1080 earlycon=sbi"
    cmd += ["-append", append_str]
    
    # Setup graphics interface
    if nographic:
        cmd += ["-nographic"]
    else:
        # Check display options, fallback to gtk or default
        cmd += ["-display", "gtk"]
        
    print(f"Executing: {' '.join(cmd)}")
    
    try:
        subprocess.run(cmd)
    except KeyboardInterrupt:
        print("\n[*] Boot terminated by user")
    except Exception as e:
        print(f"[!] QEMU boot failed: {e}")

def main():
    parser = argparse.ArgumentParser(description="Extract and boot Memory Palace PNG")
    parser.add_argument("png_file", help="Path to Memory Palace PNG file")
    parser.add_argument("--nographic", action="store_true", help="Boot console-only without GTK window")
    
    args = parser.parse_args()
    
    png_path = Path(args.png_file)
    if not png_path.exists():
        print(f"[!] PNG file not found: {png_path}")
        sys.exit(1)
        
    # Create temp directory for extraction
    with tempfile.TemporaryDirectory() as temp_dir:
        temp_path = Path(temp_dir)
        components = extract_from_png(png_path, temp_path)
        
        if not components:
            sys.exit(1)
            
        boot_qemu(components, nographic=args.nographic)

if __name__ == '__main__':
    main()

#!/usr/bin/env python3
"""
package_to_png.py - Encode kernel, initramfs, and DTB into Memory Palace PNG

Usage:
    python3 package_to_png.py <kernel> <initrd> [dtb] <output.png>
"""

import sys
import os
import json
import base64
import subprocess
import tempfile
from pathlib import Path

def package(kernel_path, initrd_path, dtb_path, output_png):
    print("=" * 60)
    print("  Memory Palace PNG Packer")
    print("=" * 60)
    
    # Read files
    facts = []
    
    # 1. Kernel
    print(f"[*] Reading Kernel: {kernel_path}")
    kernel_data = Path(kernel_path).read_bytes()
    facts.append({
        "metadata": {
            "component": "kernel"
        },
        "code_b64": base64.b64encode(kernel_data).decode('utf-8')
    })
    
    # 2. Initramfs
    print(f"[*] Reading Initramfs: {initrd_path}")
    initrd_data = Path(initrd_path).read_bytes()
    facts.append({
        "metadata": {
            "component": "initrd"
        },
        "code_b64": base64.b64encode(initrd_data).decode('utf-8')
    })
    
    # 3. DTB (Optional)
    if dtb_path and os.path.exists(dtb_path):
        print(f"[*] Reading DTB: {dtb_path}")
        dtb_data = Path(dtb_path).read_bytes()
        facts.append({
            "metadata": {
                "component": "dtb"
            },
            "code_b64": base64.b64encode(dtb_data).decode('utf-8')
        })
    
    payload = {
        "facts": facts
    }
    
    # Write temp JSON
    with tempfile.NamedTemporaryFile(mode='w', suffix='.json', delete=False) as f:
        json.dump(payload, f)
        temp_json_path = f.name
        
    try:
        print("[*] Encoding to PNG via pixelpack...")
        pixelpack = Path.home() / 'projects/zion/projects/pixelpack/target/release/pixelpack'
        
        result = subprocess.run(
            [str(pixelpack), 'encode', temp_json_path, str(output_png)],
            capture_output=True,
            text=True,
            timeout=120
        )
        
        if result.returncode == 0:
            print(f"[+] Memory Palace PNG created: {output_png}")
            size_mb = Path(output_png).stat().st_size / (1024 * 1024)
            print(f"[+] PNG size: {size_mb:.2f} MB")
            return True
        else:
            print(f"[!] Encoding failed: {result.stderr}")
            return False
            
    finally:
        if os.path.exists(temp_json_path):
            os.unlink(temp_json_path)

def main():
    if len(sys.argv) < 4:
        print("Usage: python3 package_to_png.py <kernel> <initrd> [dtb] <output.png>")
        print("Example: python3 package_to_png.py Image initramfs.cpio.gz ubuntu_palace_working.png")
        sys.exit(1)
        
    kernel = sys.argv[1]
    initrd = sys.argv[2]
    
    # Parse optional DTB argument
    if len(sys.argv) == 5:
        dtb = sys.argv[3]
        output_png = sys.argv[4]
    else:
        dtb = None
        output_png = sys.argv[3]
        
    if not package(kernel, initrd, dtb, output_png):
        sys.exit(1)

if __name__ == '__main__':
    main()

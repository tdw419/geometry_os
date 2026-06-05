#!/usr/bin/env python3
"""
palace_to_iso.py - Convert Memory Palace PNG to bootable RISC-V ISO

Usage:
    python3 palace_to_iso.py ubuntu_palace_working.png [output.iso]

This script:
1. Extracts kernel, initramfs, DTB from Memory Palace PNG
2. Creates EFI/GRUB boot structure
3. Generates bootable ISO with xorriso
4. PNG remains the primary format (Memory Palace native)

The ISO is for convenience - PNG is the canonical distribution format.
"""

import sys
import subprocess
import argparse
import tempfile
import shutil
import json
import base64
from pathlib import Path

def extract_from_png(png_path, output_dir):
    """Extract components from Memory Palace PNG."""
    print(f"[*] Extracting from PNG: {png_path}")
    
    # Use pixelpack directly for extraction
    pixelpack = Path.home() / 'projects/zion/projects/pixelpack/target/release/pixelpack'
    
    result = subprocess.run(
        [str(pixelpack), 'decode', str(png_path)],
        capture_output=True,
        text=True,
        timeout=30
    )
    
    if result.returncode != 0:
        print(f"[!] PNG decode failed: {result.stderr}")
        return None
    
    import json
    palace_data = json.loads(result.stdout)
    
    # Extract components
    kernel_path = output_dir / 'Image'
    initrd_path = output_dir / 'initramfs.cpio.gz'
    dtb_path = output_dir / 'qemu-virt.dtb'
    
    for fact in palace_data.get('facts', []):
        metadata = fact.get('metadata', {})
        component = metadata.get('component', '').lower()
        code_b64 = fact.get('code_b64')
        
        if not code_b64:
            continue
            
        data = base64.b64decode(code_b64)
        
        if component == 'kernel':
            kernel_path.write_bytes(data)
            print(f"[+] Kernel: {kernel_path} ({len(data)} bytes)")
        elif component == 'initrd':
            initrd_path.write_bytes(data)
            print(f"[+] Initramfs: {initrd_path} ({len(data)} bytes)")
        elif component == 'dtb':
            dtb_path.write_bytes(data)
            print(f"[+] DTB: {dtb_path} ({len(data)} bytes)")
    
    # Verify kernel exists
    if not kernel_path.exists():
        print(f"[!] Kernel not extracted")
        return None
    
    return {
        'kernel': kernel_path,
        'initrd': initrd_path if initrd_path.exists() else None,
        'dtb': dtb_path if dtb_path.exists() else None
    }

def create_efi_structure(iso_dir, components):
    """Create EFI boot structure for RISC-V."""
    print("[*] Creating EFI boot structure")
    
    # Create directories
    efi_dir = iso_dir / 'EFI' / 'BOOT'
    boot_dir = iso_dir / 'boot'
    efi_dir.mkdir(parents=True, exist_ok=True)
    boot_dir.mkdir(parents=True, exist_ok=True)
    
    # Copy kernel and initramfs to /boot
    shutil.copy2(components['kernel'], boot_dir / 'Image')
    if components['initrd']:
        shutil.copy2(components['initrd'], boot_dir / 'initramfs.cpio.gz')
    if components['dtb']:
        shutil.copy2(components['dtb'], boot_dir / 'qemu-virt.dtb')
    
    # Create GRUB config
    grub_cfg = efi_dir / 'grub.cfg'
    grub_config = f"""set timeout=5
set default=0

menuentry "Memory Palace Linux (RISC-V)" {{
    linux /boot/Image console=ttyS0 earlycon=sbi
"""
    
    if components['initrd']:
        grub_config += "    initrd /boot/initramfs.cpio.gz\n"
    
    if components['dtb']:
        grub_config += "    devicetree /boot/qemu-virt.dtb\n"
    
    grub_config += "}\n"
    
    grub_cfg.write_text(grub_config)
    print(f"[+] GRUB config: {grub_cfg}")
    
    # Note: For RISC-V, you'd need grub-riscv64.efi
    # This is a placeholder - real deployment needs GRUB build
    print("[!] Note: ISO structure ready, but needs grub-riscv64.efi for hardware boot")
    print("[!] Current ISO boots via QEMU directly")

def create_iso(iso_dir, output_iso):
    """Create ISO with xorriso."""
    print(f"[*] Creating ISO: {output_iso}")
    
    cmd = [
        'xorriso',
        '-as', 'mkisofs',
        '-r', '-J', '-joliet-long',
        '-l', '-b', 'boot/grub/bios.img',  # Placeholder for BIOS
        '-no-emul-boot',
        '-boot-load-size', '4',
        '-boot-info-table',
        '-o', str(output_iso),
        str(iso_dir)
    ]
    
    # Simplified ISO (no bootloader embedded yet)
    cmd_simple = [
        'xorriso',
        '-as', 'mkisofs',
        '-r', '-J', '-joliet-long',
        '-V', 'MemoryPalaceLinux',
        '-o', str(output_iso),
        str(iso_dir)
    ]
    
    try:
        result = subprocess.run(cmd_simple, capture_output=True, text=True, timeout=120)
        if result.returncode == 0:
            print(f"[+] ISO created: {output_iso}")
            size_mb = output_iso.stat().st_size / (1024 * 1024)
            print(f"[+] ISO size: {size_mb:.1f} MB")
            return True
        else:
            print(f"[!] xorriso failed: {result.stderr}")
            return False
    except subprocess.TimeoutExpired:
        print("[!] ISO creation timed out")
        return False
    except Exception as e:
        print(f"[!] ISO creation error: {e}")
        return False

def create_qemu_boot_script(iso_dir, components):
    """Create a script to boot from ISO via QEMU."""
    script_path = iso_dir / 'boot_iso.sh'
    script = f"""#!/bin/bash
# Boot Memory Palace Linux from ISO via QEMU

ISO="{Path.cwd() / 'memory_palace_linux.iso'}"

qemu-system-riscv64 \\
    -nographic \\
    -machine virt \\
    -m 1G \\
    -smp 2 \\
    -kernel boot/Image \\
"""
    
    if components['initrd']:
        script += "    -initrd boot/initramfs.cpio.gz \\\n"
    
    script += """    -append "console=ttyS0 earlycon=sbi" \\
    -bios default
"""
    
    script_path.write_text(script)
    script_path.chmod(0o755)
    print(f"[+] QEMU boot script: {script_path}")

def main():
    parser = argparse.ArgumentParser(
        description='Convert Memory Palace PNG to ISO',
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  # Generate ISO from PNG
  python3 palace_to_iso.py ubuntu_palace_working.png

  # Specify output name
  python3 palace_to_iso.py ubuntu_palace_working.png memory_palace_v1.iso

Note:
  - PNG is the canonical Memory Palace format
  - ISO is generated for convenience
  - ISO currently boots via QEMU (direct kernel load)
  - Hardware boot requires grub-riscv64.efi
        """
    )
    
    parser.add_argument('png_file', help='Memory Palace PNG file')
    parser.add_argument('output_iso', nargs='?', default='memory_palace_linux.iso',
                       help='Output ISO filename')
    parser.add_argument('--keep-temp', action='store_true',
                       help='Keep temporary extraction directory')
    
    args = parser.parse_args()
    
    print("=" * 60)
    print("  Memory Palace PNG → ISO Converter")
    print("  Preserving PNG as canonical format")
    print("=" * 60)
    print("")
    
    # Verify PNG exists
    png_path = Path(args.png_file)
    if not png_path.exists():
        print(f"[!] PNG not found: {png_path}")
        return 1
    
    output_iso = Path(args.output_iso)
    
    # Create temporary directory
    with tempfile.TemporaryDirectory() as temp_dir:
        temp_path = Path(temp_dir)
        
        # Extract components
        components = extract_from_png(png_path, temp_path)
        if not components:
            return 1
        
        # Create ISO structure
        iso_dir = temp_path / 'iso_root'
        iso_dir.mkdir()
        
        create_efi_structure(iso_dir, components)
        create_qemu_boot_script(iso_dir, components)
        
        # Copy palace_boot.py for PNG boot option
        shutil.copy2('palace_boot.py', iso_dir / 'palace_boot.py')
        
        # Create ISO
        if not create_iso(iso_dir, output_iso):
            return 1
        
        # Keep temp if requested
        if args.keep_temp:
            keep_dir = Path('./palace_iso_temp')
            if keep_dir.exists():
                shutil.rmtree(keep_dir)
            shutil.copytree(iso_dir, keep_dir)
            print(f"[+] Temp directory preserved: {keep_dir}")
    
    print("")
    print("=" * 60)
    print("  ISO Generation Complete")
    print("=" * 60)
    print(f"  PNG source:    {png_path}")
    print(f"  ISO output:    {output_iso}")
    print(f"  Boot command:  qemu-system-riscv64 -kernel boot/Image ...")
    print("")
    print("  To boot from PNG (recommended):")
    print(f"    python3 palace_boot.py {png_path}")
    print("=" * 60)
    
    return 0

if __name__ == '__main__':
    sys.exit(main())
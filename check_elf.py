#!/usr/bin/env python3
import struct, os, glob

# Find the ELF
candidates = glob.glob('.geometry_os/build/**/test_surface.elf', recursive=True)
if not candidates:
    # Also check if it's built on the fly by the test
    print("No test_surface.elf found on disk")
    print("The test builds it via build_riscv_elf() at compile time")
    exit(0)

elf_path = candidates[0]
print(f'ELF: {elf_path}')
print(f'Size: {os.path.getsize(elf_path)}')
with open(elf_path, 'rb') as fh:
    data = fh.read()
    magic = struct.unpack_from('<I', data, 0)[0]
    print(f'Magic: 0x{magic:08X}')
    ei_class = data[4]
    print(f'Class: {"64-bit" if ei_class == 2 else "32-bit"}')
    if ei_class == 2:
        e_phoff = struct.unpack_from('<Q', data, 32)[0]
        e_phentsize = struct.unpack_from('<H', data, 54)[0]
        e_phnum = struct.unpack_from('<H', data, 56)[0]
        print(f'phoff={e_phoff} phentsize={e_phentsize} phnum={e_phnum}')
        for i in range(e_phnum):
            off = e_phoff + i * e_phentsize
            p_type = struct.unpack_from('<I', data, off)[0]
            if p_type != 1:
                continue
            p_offset = struct.unpack_from('<Q', data, off+8)[0]
            p_vaddr = struct.unpack_from('<Q', data, off+16)[0]
            p_paddr = struct.unpack_from('<Q', data, off+24)[0]
            p_filesz = struct.unpack_from('<Q', data, off+32)[0]
            p_memsz = struct.unpack_from('<Q', data, off+40)[0]
            end_addr = p_paddr + p_memsz
            print(f'  Seg {i}: paddr=0x{p_paddr:08X} vaddr=0x{p_vaddr:08X} filesz=0x{p_filesz:X} memsz=0x{p_memsz:X} end=0x{end_addr:08X}')
            if p_paddr <= 0x70000000 < end_addr:
                print(f'    *** OVERLAPS VFS SURFACE (0x70000000) ***')

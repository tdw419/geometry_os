import sys
import struct

path = ".geometry_os/build/linux-6.14/vmlinux"
# 0xC0401000 is at Offset 0x401000
offset = 0x401000

with open(path, "rb") as f:
    f.seek(offset - 16)
    data = f.read(64)
    print(f"Bytes around offset {hex(offset)} (PC 0xC0401000):")
    for i in range(0, len(data), 2):
        addr = offset - 16 + i
        va = 0xC0400000 + (addr - 0x400000)
        h = struct.unpack("<H", data[i:i+2])[0]
        marker = " <--" if va == 0xC0401000 else ""
        print(f"  VA 0x{va:08x} (Off {hex(addr)}): 0x{h:04x}{marker}")

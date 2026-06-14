import sys
import struct

path = ".geometry_os/build/linux-6.14/vmlinux"
# 0xC0401000 is PA 0x80401000 -> Offset 0x401000
offset = 0x401000

with open(path, "rb") as f:
    f.seek(offset)
    data = f.read(16)
    print(f"Bytes at offset {hex(offset)} (expected PC 0xC0401000):")
    for i in range(0, len(data), 2):
        addr = offset + i
        h = struct.unpack("<H", data[i:i+2])[0]
        print(f"  Offset {hex(addr)}: 0x{h:04x}")

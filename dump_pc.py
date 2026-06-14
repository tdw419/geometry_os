import sys
import struct

path = ".geometry_os/build/linux-6.14/vmlinux"
# 0xC0401000 is in Segment 1 (Offset 0x400000 -> VA 0xC0400000)
# Offset for 0xC0401000 = 0x400000 + (0xC0401000 - 0xC0400000) = 0x401000
offset = 0x401000

with open(path, "rb") as f:
    f.seek(offset)
    data = f.read(16)
    print(f"Bytes at offset {hex(offset)} (PC 0xC0401000):")
    print(" ".join(f"{b:02x}" for b in data))
    # Print as little-endian u32s
    for i in range(0, len(data), 4):
        word = struct.unpack("<I", data[i:i+4])[0]
        print(f"  + {i:02x}: 0x{word:08x}")

import sys
import struct

path = ".geometry_os/build/linux-6.14/vmlinux"
# Entry point is 0xC0000000. Program Header 0 says it's at Offset 0x1000.
# Entry word was 0x106f5a4d.
# Half 0x5a4d = c.li s4, -13
# Half 0x106f = c.j ...? (Offset 0x106f)
# Offset in compressed J is: offset[11|4|9:8|10|6|7|3:1|5|0]
# 0x106f -> 0001 0000 0110 1111
# Let's just look at the next few words.
offset = 0x1000

with open(path, "rb") as f:
    f.seek(offset)
    data = f.read(64)
    print(f"Bytes at offset {hex(offset)} (PC 0xC0000000):")
    for i in range(0, len(data), 4):
        word = struct.unpack("<I", data[i:i+4])[0]
        print(f"  + {i:02x}: 0x{word:08x}")

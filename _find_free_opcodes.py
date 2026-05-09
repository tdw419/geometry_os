#!/usr/bin/env python3
import re, glob

assigned = set()
for f in glob.glob('src/assembler/*.rs'):
    with open(f) as fh:
        for line in fh:
            m = re.search(r'bytecode\.push\((0x[0-9A-Fa-f]+)\)', line)
            if m:
                assigned.add(int(m.group(1), 16))

for f in glob.glob('src/vm/*.rs'):
    with open(f) as fh:
        for line in fh:
            m = re.search(r'(0x[0-9A-Fa-f][0-9A-Fa-f])\s*=>', line)
            if m:
                assigned.add(int(m.group(1), 16))

for i in range(0x00, 0x100):
    if i not in assigned:
        print(f'0x{i:02X} is FREE')

print(f'\nTotal assigned: {len(assigned)}')

import re
with open('src/vm/mod.rs', 'r') as f: content = f.read()
used = set()
for m in re.finditer(r'0x([0-9A-Fa-f]{2}) =>', content):
    used.add(int(m.group(1), 16))
for i in range(256):
    if i not in used:
        print(f"Free: {hex(i)}")

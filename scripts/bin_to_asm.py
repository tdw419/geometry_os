import sys
with open(sys.argv[1], 'rb') as f:
    data = f.read()
print(".org 0x1000")
for i in range(0, len(data), 4):
    word = data[i:i+4]
    if len(word) == 4:
        val = (word[0]<<24) | (word[1]<<16) | (word[2]<<8) | word[3]
        print(f"db {hex(val)}")

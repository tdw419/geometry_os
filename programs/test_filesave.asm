# Minimal Memory Palace FILEOPEN + FILEWRITE test
# Writes "Hello" to ~/.geometry_os/vmfs/middle_ring/file_005.dat (ring=1, angle=5)

# FILEOPEN ring=1, angle=5 (0xD0, 1, 5) - returns fd in r0
0xD0, 1, 5

# Set up buffer at 0x2000 with "Hello" (ASCII: H=72, e=101, l=108, l=108, o=111)
LDI r1, 72
STORE r1, 0x2000
LDI r1, 101
STORE r1, 0x2004
LDI r1, 108
STORE r1, 0x2008
LDI r1, 108
STORE r1, 0x200C
LDI r1, 111
STORE r1, 0x2010

# FILEWRITE fd=r0, buf=0x2000, len=5 (0xD2, 0, 10, 11)
LDI r10, 0x2000
LDI r11, 5
0xD2, 0, 10, 11

HALT
; DESCRIPTION: Places a black 110x64 rectangle at position (37, 151).
; PLAN: r0=37(x), r1=151(y), r2=110(width), r3=64(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 151
LDI r2, 110
LDI r3, 64
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

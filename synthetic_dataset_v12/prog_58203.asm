; DESCRIPTION: Places a black 80x22 rectangle at position (345, 151).
; PLAN: r0=345(x), r1=151(y), r2=80(width), r3=22(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 151
LDI r2, 80
LDI r3, 22
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

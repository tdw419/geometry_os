; DESCRIPTION: Places a cyan 14x22 rectangle at position (22, 151).
; PLAN: r0=22(x), r1=151(y), r2=14(width), r3=22(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 151
LDI r2, 14
LDI r3, 22
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT

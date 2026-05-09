; DESCRIPTION: Renders a black box of size 81x13 starting at (95, 151).
; PLAN: r0=95(x), r1=151(y), r2=81(width), r3=13(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 151
LDI r2, 81
LDI r3, 13
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a black box of size 116x110 starting at (371, 99).
; PLAN: r0=371(x), r1=99(y), r2=116(width), r3=110(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 99
LDI r2, 116
LDI r3, 110
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a black box of size 64x99 starting at (8, 2).
; PLAN: r0=8(x), r1=2(y), r2=64(width), r3=99(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 2
LDI r2, 64
LDI r3, 99
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

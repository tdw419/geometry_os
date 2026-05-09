; DESCRIPTION: Renders a black box of size 20x84 starting at (62, 8).
; PLAN: r0=62(x), r1=8(y), r2=20(width), r3=84(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 8
LDI r2, 20
LDI r3, 84
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

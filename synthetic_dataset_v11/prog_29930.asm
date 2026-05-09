; DESCRIPTION: Renders a green box of size 33x84 starting at (62, 2).
; PLAN: r0=62(x), r1=2(y), r2=33(width), r3=84(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 2
LDI r2, 33
LDI r3, 84
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

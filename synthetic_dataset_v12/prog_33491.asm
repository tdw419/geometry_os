; DESCRIPTION: Renders a yellow box of size 65x101 starting at (227, 135).
; PLAN: r0=227(x), r1=135(y), r2=65(width), r3=101(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 135
LDI r2, 65
LDI r3, 101
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

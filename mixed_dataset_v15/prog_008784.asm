; DESCRIPTION: Renders a yellow box of size 40x106 starting at (89, 63).
; PLAN: r0=89(x), r1=63(y), r2=40(width), r3=106(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 63
LDI r2, 40
LDI r3, 106
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

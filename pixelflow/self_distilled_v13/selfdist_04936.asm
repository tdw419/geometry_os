; DESCRIPTION: Renders a green rectangular region spanning 105 by 89 at (8, 36).
; PLAN: r0=8(x), r1=36(y), r2=105(width), r3=89(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 36
LDI r2, 105
LDI r3, 89
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

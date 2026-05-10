; DESCRIPTION: Renders a green rectangular region spanning 118 by 112 at (86, 4).
; PLAN: r0=86(x), r1=4(y), r2=118(width), r3=112(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 4
LDI r2, 118
LDI r3, 112
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

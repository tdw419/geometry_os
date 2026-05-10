; DESCRIPTION: Renders a green rectangular region spanning 114 by 52 at (71, 97).
; PLAN: r0=71(x), r1=97(y), r2=114(width), r3=52(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 97
LDI r2, 114
LDI r3, 52
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

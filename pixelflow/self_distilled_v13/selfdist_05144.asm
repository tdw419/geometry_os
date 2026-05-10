; DESCRIPTION: Renders a green rectangular region spanning 25 by 34 at (221, 147).
; PLAN: r0=221(x), r1=147(y), r2=25(width), r3=34(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 147
LDI r2, 25
LDI r3, 34
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

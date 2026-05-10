; DESCRIPTION: Renders a green rectangular region spanning 85 by 19 at (188, 105).
; PLAN: r0=188(x), r1=105(y), r2=85(width), r3=19(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 105
LDI r2, 85
LDI r3, 19
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

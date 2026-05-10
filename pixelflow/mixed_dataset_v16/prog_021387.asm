; DESCRIPTION: Renders a green rectangular region spanning 96 by 43 at (385, 85).
; PLAN: r0=385(x), r1=85(y), r2=96(width), r3=43(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 85
LDI r2, 96
LDI r3, 43
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

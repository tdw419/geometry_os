; DESCRIPTION: Draws a orange circle centered at (297, 155) with radius 74.
; PLAN: r0=297(x), r1=155(y), r2=74(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 297
LDI r1, 155
LDI r2, 74
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT

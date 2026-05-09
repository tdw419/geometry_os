; DESCRIPTION: Draws a orange circle centered at (297, 90) with radius 22.
; PLAN: r0=297(x), r1=90(y), r2=22(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 297
LDI r1, 90
LDI r2, 22
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT

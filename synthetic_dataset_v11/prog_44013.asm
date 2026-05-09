; DESCRIPTION: Draws a orange circle centered at (31, 85) with radius 24.
; PLAN: r0=31(x), r1=85(y), r2=24(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 31
LDI r1, 85
LDI r2, 24
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT

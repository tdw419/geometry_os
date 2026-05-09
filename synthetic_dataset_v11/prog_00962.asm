; DESCRIPTION: Draws a orange circle centered at (51, 170) with radius 31.
; PLAN: r0=51(x), r1=170(y), r2=31(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 51
LDI r1, 170
LDI r2, 31
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT

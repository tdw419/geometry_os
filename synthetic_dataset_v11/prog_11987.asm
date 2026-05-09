; DESCRIPTION: Draws a orange circle centered at (63, 170) with radius 11.
; PLAN: r0=63(x), r1=170(y), r2=11(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 63
LDI r1, 170
LDI r2, 11
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT

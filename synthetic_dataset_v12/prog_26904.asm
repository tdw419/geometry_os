; DESCRIPTION: Draws a orange circle centered at (418, 170) with radius 77.
; PLAN: r0=418(x), r1=170(y), r2=77(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 418
LDI r1, 170
LDI r2, 77
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT

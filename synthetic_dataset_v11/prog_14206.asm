; DESCRIPTION: Draws a orange circle centered at (163, 97) with radius 39.
; PLAN: r0=163(x), r1=97(y), r2=39(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 163
LDI r1, 97
LDI r2, 39
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT

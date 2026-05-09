; DESCRIPTION: Draws a orange circle centered at (421, 97) with radius 35.
; PLAN: r0=421(x), r1=97(y), r2=35(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 421
LDI r1, 97
LDI r2, 35
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT

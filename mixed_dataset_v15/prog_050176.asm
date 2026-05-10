; DESCRIPTION: Draws a orange circle centered at (204, 148) with radius 15.
; PLAN: r0=204(x), r1=148(y), r2=15(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 204
LDI r1, 148
LDI r2, 15
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT

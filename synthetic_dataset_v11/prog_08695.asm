; DESCRIPTION: Draws a orange circle centered at (204, 159) with radius 45.
; PLAN: r0=204(x), r1=159(y), r2=45(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 204
LDI r1, 159
LDI r2, 45
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT

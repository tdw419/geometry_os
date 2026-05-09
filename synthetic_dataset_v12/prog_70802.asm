; DESCRIPTION: Draws a orange circle centered at (159, 136) with radius 43.
; PLAN: r0=159(x), r1=136(y), r2=43(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 159
LDI r1, 136
LDI r2, 43
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT

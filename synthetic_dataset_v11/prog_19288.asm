; DESCRIPTION: Draws a orange circle centered at (159, 174) with radius 47.
; PLAN: r0=159(x), r1=174(y), r2=47(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 159
LDI r1, 174
LDI r2, 47
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT

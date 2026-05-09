; DESCRIPTION: Draws a orange circle centered at (159, 72) with radius 68.
; PLAN: r0=159(x), r1=72(y), r2=68(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 159
LDI r1, 72
LDI r2, 68
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT

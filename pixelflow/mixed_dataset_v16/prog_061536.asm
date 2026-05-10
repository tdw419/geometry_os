; DESCRIPTION: Draws a orange circle centered at (125, 157) with radius 66.
; PLAN: r0=125(x), r1=157(y), r2=66(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 125
LDI r1, 157
LDI r2, 66
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT

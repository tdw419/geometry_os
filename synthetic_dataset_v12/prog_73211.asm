; DESCRIPTION: Draws a orange circle centered at (457, 157) with radius 33.
; PLAN: r0=457(x), r1=157(y), r2=33(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 457
LDI r1, 157
LDI r2, 33
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT

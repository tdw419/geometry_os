; DESCRIPTION: Draws a orange circle centered at (334, 189) with radius 58.
; PLAN: r0=334(x), r1=189(y), r2=58(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 334
LDI r1, 189
LDI r2, 58
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT

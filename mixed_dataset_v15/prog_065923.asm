; DESCRIPTION: Draws a orange circle centered at (331, 92) with radius 33.
; PLAN: r0=331(x), r1=92(y), r2=33(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 331
LDI r1, 92
LDI r2, 33
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT

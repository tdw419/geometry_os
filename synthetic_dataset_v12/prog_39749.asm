; DESCRIPTION: Draws a orange circle centered at (53, 112) with radius 45.
; PLAN: r0=53(x), r1=112(y), r2=45(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 53
LDI r1, 112
LDI r2, 45
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT

; DESCRIPTION: Draws a orange circle centered at (341, 56) with radius 44.
; PLAN: r0=341(x), r1=56(y), r2=44(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 341
LDI r1, 56
LDI r2, 44
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT

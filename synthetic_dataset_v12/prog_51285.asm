; DESCRIPTION: Draws a orange circle centered at (341, 157) with radius 46.
; PLAN: r0=341(x), r1=157(y), r2=46(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 341
LDI r1, 157
LDI r2, 46
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT

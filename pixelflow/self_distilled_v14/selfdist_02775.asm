; DESCRIPTION: Draws a orange circle centered at (241, 63) with radius 69.
; PLAN: r0=241(x), r1=63(y), r2=69(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 241
LDI r1, 63
LDI r2, 69
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT

; DESCRIPTION: Draws a orange circle centered at (382, 63) with radius 55.
; PLAN: r0=382(x), r1=63(y), r2=55(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 382
LDI r1, 63
LDI r2, 55
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT

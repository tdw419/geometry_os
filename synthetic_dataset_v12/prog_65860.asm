; DESCRIPTION: Draws a orange circle centered at (62, 63) with radius 14.
; PLAN: r0=62(x), r1=63(y), r2=14(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 62
LDI r1, 63
LDI r2, 14
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT

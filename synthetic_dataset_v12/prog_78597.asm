; DESCRIPTION: Draws a orange circle centered at (219, 63) with radius 19.
; PLAN: r0=219(x), r1=63(y), r2=19(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 219
LDI r1, 63
LDI r2, 19
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT

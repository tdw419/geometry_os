; DESCRIPTION: Draws a orange circle centered at (219, 34) with radius 14.
; PLAN: r0=219(x), r1=34(y), r2=14(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 219
LDI r1, 34
LDI r2, 14
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT

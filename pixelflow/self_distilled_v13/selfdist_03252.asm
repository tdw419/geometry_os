; DESCRIPTION: Draws a orange circle centered at (282, 39) with radius 10.
; PLAN: r0=282(x), r1=39(y), r2=10(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 282
LDI r1, 39
LDI r2, 10
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT

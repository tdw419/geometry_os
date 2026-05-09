; DESCRIPTION: Draws a orange circle centered at (100, 155) with radius 42.
; PLAN: r0=100(x), r1=155(y), r2=42(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 100
LDI r1, 155
LDI r2, 42
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT

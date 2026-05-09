; DESCRIPTION: Draws a orange circle centered at (419, 117) with radius 63.
; PLAN: r0=419(x), r1=117(y), r2=63(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 419
LDI r1, 117
LDI r2, 63
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT

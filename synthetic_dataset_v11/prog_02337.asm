; DESCRIPTION: Draws a orange circle centered at (75, 80) with radius 63.
; PLAN: r0=75(x), r1=80(y), r2=63(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 75
LDI r1, 80
LDI r2, 63
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT

; DESCRIPTION: Draws a orange circle centered at (84, 61) with radius 20.
; PLAN: r0=84(x), r1=61(y), r2=20(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 84
LDI r1, 61
LDI r2, 20
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT

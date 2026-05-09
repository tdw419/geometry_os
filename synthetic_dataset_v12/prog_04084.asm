; DESCRIPTION: Draws a orange circle centered at (252, 84) with radius 79.
; PLAN: r0=252(x), r1=84(y), r2=79(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 252
LDI r1, 84
LDI r2, 79
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT

; DESCRIPTION: Draws a orange circle centered at (318, 84) with radius 65.
; PLAN: r0=318(x), r1=84(y), r2=65(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 318
LDI r1, 84
LDI r2, 65
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT

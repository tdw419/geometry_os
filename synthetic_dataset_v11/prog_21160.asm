; DESCRIPTION: Draws a orange circle centered at (166, 99) with radius 63.
; PLAN: r0=166(x), r1=99(y), r2=63(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 166
LDI r1, 99
LDI r2, 63
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT

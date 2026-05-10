; DESCRIPTION: Draws a orange circle centered at (188, 127) with radius 63.
; PLAN: r0=188(x), r1=127(y), r2=63(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 188
LDI r1, 127
LDI r2, 63
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT

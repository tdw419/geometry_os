; DESCRIPTION: Draws a yellow circle centered at (75, 85) with radius 63.
; PLAN: r0=75(x), r1=85(y), r2=63(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 75
LDI r1, 85
LDI r2, 63
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT

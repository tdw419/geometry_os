; DESCRIPTION: Draws a magenta circle centered at (250, 85) with radius 55.
; PLAN: r0=250(x), r1=85(y), r2=55(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 250
LDI r1, 85
LDI r2, 55
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT

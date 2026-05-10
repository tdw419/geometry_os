; DESCRIPTION: Draws a magenta circle centered at (424, 119) with radius 79.
; PLAN: r0=424(x), r1=119(y), r2=79(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 424
LDI r1, 119
LDI r2, 79
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT

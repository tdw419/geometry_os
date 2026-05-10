; DESCRIPTION: Draws a magenta circle centered at (139, 112) with radius 63.
; PLAN: r0=139(x), r1=112(y), r2=63(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 139
LDI r1, 112
LDI r2, 63
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT

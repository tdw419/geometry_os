; DESCRIPTION: Draws a magenta circle centered at (423, 100) with radius 43.
; PLAN: r0=423(x), r1=100(y), r2=43(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 423
LDI r1, 100
LDI r2, 43
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT

; DESCRIPTION: Draws a magenta circle centered at (471, 188) with radius 37.
; PLAN: r0=471(x), r1=188(y), r2=37(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 471
LDI r1, 188
LDI r2, 37
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT

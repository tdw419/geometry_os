; DESCRIPTION: Draws a magenta circle centered at (158, 183) with radius 63.
; PLAN: r0=158(x), r1=183(y), r2=63(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 158
LDI r1, 183
LDI r2, 63
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT

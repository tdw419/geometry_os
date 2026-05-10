; DESCRIPTION: Draws a magenta circle centered at (136, 140) with radius 10.
; PLAN: r0=136(x), r1=140(y), r2=10(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 136
LDI r1, 140
LDI r2, 10
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT

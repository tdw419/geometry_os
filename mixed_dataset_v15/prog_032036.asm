; DESCRIPTION: Draws a magenta circle centered at (109, 119) with radius 78.
; PLAN: r0=109(x), r1=119(y), r2=78(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 109
LDI r1, 119
LDI r2, 78
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT

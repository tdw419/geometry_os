; DESCRIPTION: Draws a magenta circle centered at (109, 85) with radius 64.
; PLAN: r0=109(x), r1=85(y), r2=64(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 109
LDI r1, 85
LDI r2, 64
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT

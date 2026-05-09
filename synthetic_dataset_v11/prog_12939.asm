; DESCRIPTION: Draws a magenta circle centered at (155, 75) with radius 42.
; PLAN: r0=155(x), r1=75(y), r2=42(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 155
LDI r1, 75
LDI r2, 42
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT

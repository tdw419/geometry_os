; DESCRIPTION: Draws a magenta circle centered at (156, 74) with radius 45.
; PLAN: r0=156(x), r1=74(y), r2=45(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 156
LDI r1, 74
LDI r2, 45
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT

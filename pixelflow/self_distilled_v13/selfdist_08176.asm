; DESCRIPTION: Draws a magenta circle centered at (24, 74) with radius 13.
; PLAN: r0=24(x), r1=74(y), r2=13(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 24
LDI r1, 74
LDI r2, 13
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT

; DESCRIPTION: Draws a magenta circle centered at (62, 96) with radius 50.
; PLAN: r0=62(x), r1=96(y), r2=50(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 62
LDI r1, 96
LDI r2, 50
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT

; DESCRIPTION: Draws a magenta circle centered at (144, 69) with radius 30.
; PLAN: r0=144(x), r1=69(y), r2=30(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 144
LDI r1, 69
LDI r2, 30
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT

; DESCRIPTION: Draws a magenta circle centered at (144, 174) with radius 69.
; PLAN: r0=144(x), r1=174(y), r2=69(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 144
LDI r1, 174
LDI r2, 69
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT

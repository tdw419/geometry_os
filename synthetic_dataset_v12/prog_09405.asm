; DESCRIPTION: Draws a magenta circle centered at (157, 134) with radius 69.
; PLAN: r0=157(x), r1=134(y), r2=69(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 157
LDI r1, 134
LDI r2, 69
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT

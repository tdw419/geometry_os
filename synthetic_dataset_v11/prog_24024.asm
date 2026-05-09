; DESCRIPTION: Draws a magenta circle centered at (55, 195) with radius 45.
; PLAN: r0=55(x), r1=195(y), r2=45(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 55
LDI r1, 195
LDI r2, 45
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT

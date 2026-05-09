; DESCRIPTION: Draws a magenta circle centered at (182, 145) with radius 69.
; PLAN: r0=182(x), r1=145(y), r2=69(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 182
LDI r1, 145
LDI r2, 69
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT

; DESCRIPTION: Draws a magenta circle centered at (366, 109) with radius 69.
; PLAN: r0=366(x), r1=109(y), r2=69(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 366
LDI r1, 109
LDI r2, 69
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT

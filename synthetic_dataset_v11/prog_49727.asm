; DESCRIPTION: Draws a magenta circle centered at (126, 178) with radius 69.
; PLAN: r0=126(x), r1=178(y), r2=69(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 126
LDI r1, 178
LDI r2, 69
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT

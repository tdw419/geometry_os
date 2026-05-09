; DESCRIPTION: Draws a magenta circle centered at (201, 67) with radius 26.
; PLAN: r0=201(x), r1=67(y), r2=26(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 201
LDI r1, 67
LDI r2, 26
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT

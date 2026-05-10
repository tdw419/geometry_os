; DESCRIPTION: Draws a blue circle centered at (246, 36) with radius 69.
; PLAN: r0=246(x), r1=36(y), r2=69(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 246
LDI r1, 36
LDI r2, 69
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT

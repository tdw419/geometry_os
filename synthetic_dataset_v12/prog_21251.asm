; DESCRIPTION: Draws a magenta circle centered at (142, 116) with radius 67.
; PLAN: r0=142(x), r1=116(y), r2=67(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 142
LDI r1, 116
LDI r2, 67
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT

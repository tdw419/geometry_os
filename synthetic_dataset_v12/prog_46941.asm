; DESCRIPTION: Draws a magenta circle centered at (376, 101) with radius 67.
; PLAN: r0=376(x), r1=101(y), r2=67(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 376
LDI r1, 101
LDI r2, 67
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT

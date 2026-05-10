; DESCRIPTION: Draws a magenta circle centered at (177, 85) with radius 67.
; PLAN: r0=177(x), r1=85(y), r2=67(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 177
LDI r1, 85
LDI r2, 67
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT

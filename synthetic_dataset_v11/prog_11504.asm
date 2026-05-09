; DESCRIPTION: Draws a magenta circle centered at (104, 126) with radius 74.
; PLAN: r0=104(x), r1=126(y), r2=74(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 104
LDI r1, 126
LDI r2, 74
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT

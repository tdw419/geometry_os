; DESCRIPTION: Draws a magenta circle centered at (316, 70) with radius 49.
; PLAN: r0=316(x), r1=70(y), r2=49(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 316
LDI r1, 70
LDI r2, 49
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT

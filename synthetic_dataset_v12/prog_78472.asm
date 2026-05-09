; DESCRIPTION: Draws a magenta circle centered at (104, 123) with radius 77.
; PLAN: r0=104(x), r1=123(y), r2=77(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 104
LDI r1, 123
LDI r2, 77
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT

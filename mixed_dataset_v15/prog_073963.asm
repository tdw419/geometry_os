; DESCRIPTION: Draws a magenta circle centered at (276, 172) with radius 53.
; PLAN: r0=276(x), r1=172(y), r2=53(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 276
LDI r1, 172
LDI r2, 53
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT

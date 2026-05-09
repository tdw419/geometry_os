; DESCRIPTION: Draws a magenta circle centered at (457, 116) with radius 41.
; PLAN: r0=457(x), r1=116(y), r2=41(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 457
LDI r1, 116
LDI r2, 41
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT

; DESCRIPTION: Draws a magenta circle centered at (310, 101) with radius 71.
; PLAN: r0=310(x), r1=101(y), r2=71(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 310
LDI r1, 101
LDI r2, 71
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT

; DESCRIPTION: Draws a magenta circle centered at (41, 192) with radius 29.
; PLAN: r0=41(x), r1=192(y), r2=29(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 41
LDI r1, 192
LDI r2, 29
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT

; DESCRIPTION: Draws a magenta circle centered at (41, 193) with radius 11.
; PLAN: r0=41(x), r1=193(y), r2=11(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 41
LDI r1, 193
LDI r2, 11
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT

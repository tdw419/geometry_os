; DESCRIPTION: Draws a black circle centered at (114, 85) with radius 41.
; PLAN: r0=114(x), r1=85(y), r2=41(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 114
LDI r1, 85
LDI r2, 41
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT

; DESCRIPTION: Draws a black circle centered at (120, 135) with radius 41.
; PLAN: r0=120(x), r1=135(y), r2=41(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 120
LDI r1, 135
LDI r2, 41
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT

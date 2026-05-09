; DESCRIPTION: Draws a blue circle centered at (174, 94) with radius 41.
; PLAN: r0=174(x), r1=94(y), r2=41(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 174
LDI r1, 94
LDI r2, 41
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT

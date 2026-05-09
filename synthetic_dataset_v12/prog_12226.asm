; DESCRIPTION: Draws a blue circle centered at (291, 186) with radius 41.
; PLAN: r0=291(x), r1=186(y), r2=41(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 291
LDI r1, 186
LDI r2, 41
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT

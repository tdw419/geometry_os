; DESCRIPTION: Draws a blue circle centered at (396, 50) with radius 41.
; PLAN: r0=396(x), r1=50(y), r2=41(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 396
LDI r1, 50
LDI r2, 41
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT

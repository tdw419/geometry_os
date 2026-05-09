; DESCRIPTION: Draws a blue circle centered at (441, 168) with radius 41.
; PLAN: r0=441(x), r1=168(y), r2=41(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 441
LDI r1, 168
LDI r2, 41
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT

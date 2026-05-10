; DESCRIPTION: Draws a purple circle centered at (67, 109) with radius 41.
; PLAN: r0=67(x), r1=109(y), r2=41(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 67
LDI r1, 109
LDI r2, 41
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

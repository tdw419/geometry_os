; DESCRIPTION: Draws a purple circle centered at (153, 175) with radius 41.
; PLAN: r0=153(x), r1=175(y), r2=41(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 153
LDI r1, 175
LDI r2, 41
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

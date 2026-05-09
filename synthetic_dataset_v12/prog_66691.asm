; DESCRIPTION: Draws a purple circle centered at (205, 41) with radius 17.
; PLAN: r0=205(x), r1=41(y), r2=17(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 205
LDI r1, 41
LDI r2, 17
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

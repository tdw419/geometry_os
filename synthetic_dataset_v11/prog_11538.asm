; DESCRIPTION: Draws a purple circle centered at (141, 122) with radius 19.
; PLAN: r0=141(x), r1=122(y), r2=19(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 141
LDI r1, 122
LDI r2, 19
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

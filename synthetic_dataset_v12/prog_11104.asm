; DESCRIPTION: Draws a purple circle centered at (114, 164) with radius 39.
; PLAN: r0=114(x), r1=164(y), r2=39(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 114
LDI r1, 164
LDI r2, 39
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

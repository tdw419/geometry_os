; DESCRIPTION: Draws a purple circle centered at (317, 136) with radius 53.
; PLAN: r0=317(x), r1=136(y), r2=53(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 317
LDI r1, 136
LDI r2, 53
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

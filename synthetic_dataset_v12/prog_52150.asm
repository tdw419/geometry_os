; DESCRIPTION: Draws a purple circle centered at (382, 142) with radius 76.
; PLAN: r0=382(x), r1=142(y), r2=76(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 382
LDI r1, 142
LDI r2, 76
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

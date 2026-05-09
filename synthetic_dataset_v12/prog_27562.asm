; DESCRIPTION: Draws a purple circle centered at (488, 169) with radius 13.
; PLAN: r0=488(x), r1=169(y), r2=13(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 488
LDI r1, 169
LDI r2, 13
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

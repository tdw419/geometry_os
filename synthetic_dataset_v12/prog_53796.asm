; DESCRIPTION: Draws a purple circle centered at (191, 139) with radius 24.
; PLAN: r0=191(x), r1=139(y), r2=24(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 191
LDI r1, 139
LDI r2, 24
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

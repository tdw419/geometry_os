; DESCRIPTION: Draws a purple circle centered at (333, 139) with radius 73.
; PLAN: r0=333(x), r1=139(y), r2=73(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 333
LDI r1, 139
LDI r2, 73
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

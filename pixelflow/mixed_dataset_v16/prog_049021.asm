; DESCRIPTION: Draws a purple circle centered at (72, 157) with radius 22.
; PLAN: r0=72(x), r1=157(y), r2=22(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 72
LDI r1, 157
LDI r2, 22
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

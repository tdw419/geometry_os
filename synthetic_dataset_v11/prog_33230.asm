; DESCRIPTION: Draws a purple circle centered at (164, 80) with radius 73.
; PLAN: r0=164(x), r1=80(y), r2=73(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 164
LDI r1, 80
LDI r2, 73
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

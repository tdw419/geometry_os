; DESCRIPTION: Draws a purple circle centered at (251, 157) with radius 28.
; PLAN: r0=251(x), r1=157(y), r2=28(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 251
LDI r1, 157
LDI r2, 28
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

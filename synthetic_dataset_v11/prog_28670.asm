; DESCRIPTION: Draws a purple circle centered at (128, 162) with radius 60.
; PLAN: r0=128(x), r1=162(y), r2=60(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 128
LDI r1, 162
LDI r2, 60
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

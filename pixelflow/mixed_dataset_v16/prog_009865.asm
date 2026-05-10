; DESCRIPTION: Draws a purple circle centered at (128, 175) with radius 22.
; PLAN: r0=128(x), r1=175(y), r2=22(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 128
LDI r1, 175
LDI r2, 22
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

; DESCRIPTION: Draws a purple circle centered at (162, 175) with radius 31.
; PLAN: r0=162(x), r1=175(y), r2=31(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 162
LDI r1, 175
LDI r2, 31
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

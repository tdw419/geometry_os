; DESCRIPTION: Draws a purple circle centered at (108, 96) with radius 30.
; PLAN: r0=108(x), r1=96(y), r2=30(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 108
LDI r1, 96
LDI r2, 30
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

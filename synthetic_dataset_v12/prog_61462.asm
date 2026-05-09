; DESCRIPTION: Draws a purple circle centered at (396, 135) with radius 32.
; PLAN: r0=396(x), r1=135(y), r2=32(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 396
LDI r1, 135
LDI r2, 32
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

; DESCRIPTION: Draws a purple circle centered at (371, 143) with radius 76.
; PLAN: r0=371(x), r1=143(y), r2=76(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 371
LDI r1, 143
LDI r2, 76
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

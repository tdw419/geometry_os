; DESCRIPTION: Draws a purple circle centered at (236, 132) with radius 69.
; PLAN: r0=236(x), r1=132(y), r2=69(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 236
LDI r1, 132
LDI r2, 69
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

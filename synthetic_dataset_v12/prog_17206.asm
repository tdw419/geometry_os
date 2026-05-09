; DESCRIPTION: Draws a purple circle centered at (482, 64) with radius 19.
; PLAN: r0=482(x), r1=64(y), r2=19(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 482
LDI r1, 64
LDI r2, 19
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

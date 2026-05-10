; DESCRIPTION: Draws a purple circle centered at (469, 218) with radius 17.
; PLAN: r0=469(x), r1=218(y), r2=17(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 469
LDI r1, 218
LDI r2, 17
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

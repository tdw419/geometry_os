; DESCRIPTION: Draws a purple circle centered at (271, 75) with radius 53.
; PLAN: r0=271(x), r1=75(y), r2=53(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 271
LDI r1, 75
LDI r2, 53
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

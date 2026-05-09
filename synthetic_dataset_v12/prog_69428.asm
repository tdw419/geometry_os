; DESCRIPTION: Draws a purple circle centered at (335, 29) with radius 14.
; PLAN: r0=335(x), r1=29(y), r2=14(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 335
LDI r1, 29
LDI r2, 14
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

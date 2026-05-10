; DESCRIPTION: Draws a purple circle centered at (355, 176) with radius 56.
; PLAN: r0=355(x), r1=176(y), r2=56(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 355
LDI r1, 176
LDI r2, 56
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

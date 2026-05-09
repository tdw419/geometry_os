; DESCRIPTION: Draws a purple circle centered at (133, 176) with radius 74.
; PLAN: r0=133(x), r1=176(y), r2=74(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 133
LDI r1, 176
LDI r2, 74
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

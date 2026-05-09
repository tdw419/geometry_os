; DESCRIPTION: Draws a purple circle centered at (110, 171) with radius 36.
; PLAN: r0=110(x), r1=171(y), r2=36(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 110
LDI r1, 171
LDI r2, 36
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

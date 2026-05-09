; DESCRIPTION: Draws a purple circle centered at (86, 185) with radius 21.
; PLAN: r0=86(x), r1=185(y), r2=21(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 86
LDI r1, 185
LDI r2, 21
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

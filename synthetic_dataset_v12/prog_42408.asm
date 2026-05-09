; DESCRIPTION: Draws a purple circle centered at (272, 185) with radius 54.
; PLAN: r0=272(x), r1=185(y), r2=54(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 272
LDI r1, 185
LDI r2, 54
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

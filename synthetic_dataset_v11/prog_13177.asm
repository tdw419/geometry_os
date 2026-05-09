; DESCRIPTION: Draws a purple circle centered at (97, 150) with radius 43.
; PLAN: r0=97(x), r1=150(y), r2=43(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 97
LDI r1, 150
LDI r2, 43
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

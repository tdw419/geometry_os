; DESCRIPTION: Draws a purple circle centered at (319, 61) with radius 50.
; PLAN: r0=319(x), r1=61(y), r2=50(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 319
LDI r1, 61
LDI r2, 50
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

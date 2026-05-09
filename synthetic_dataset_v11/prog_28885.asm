; DESCRIPTION: Draws a purple circle centered at (183, 205) with radius 35.
; PLAN: r0=183(x), r1=205(y), r2=35(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 183
LDI r1, 205
LDI r2, 35
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

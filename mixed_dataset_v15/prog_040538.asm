; DESCRIPTION: Draws a purple circle centered at (239, 170) with radius 14.
; PLAN: r0=239(x), r1=170(y), r2=14(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 239
LDI r1, 170
LDI r2, 14
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

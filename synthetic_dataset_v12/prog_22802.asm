; DESCRIPTION: Draws a purple circle centered at (239, 37) with radius 15.
; PLAN: r0=239(x), r1=37(y), r2=15(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 239
LDI r1, 37
LDI r2, 15
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

; DESCRIPTION: Draws a purple circle centered at (239, 187) with radius 35.
; PLAN: r0=239(x), r1=187(y), r2=35(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 239
LDI r1, 187
LDI r2, 35
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

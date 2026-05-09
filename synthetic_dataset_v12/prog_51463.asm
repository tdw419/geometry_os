; DESCRIPTION: Draws a purple circle centered at (273, 98) with radius 18.
; PLAN: r0=273(x), r1=98(y), r2=18(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 273
LDI r1, 98
LDI r2, 18
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

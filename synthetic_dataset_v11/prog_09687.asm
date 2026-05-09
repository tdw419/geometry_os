; DESCRIPTION: Draws a purple circle centered at (25, 28) with radius 13.
; PLAN: r0=25(x), r1=28(y), r2=13(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 25
LDI r1, 28
LDI r2, 13
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

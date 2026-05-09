; DESCRIPTION: Draws a purple circle centered at (130, 72) with radius 28.
; PLAN: r0=130(x), r1=72(y), r2=28(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 130
LDI r1, 72
LDI r2, 28
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

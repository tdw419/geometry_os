; DESCRIPTION: Draws a purple circle centered at (340, 67) with radius 13.
; PLAN: r0=340(x), r1=67(y), r2=13(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 340
LDI r1, 67
LDI r2, 13
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

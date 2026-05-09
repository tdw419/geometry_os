; DESCRIPTION: Draws a blue circle centered at (203, 217) with radius 22.
; PLAN: r0=203(x), r1=217(y), r2=22(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 203
LDI r1, 217
LDI r2, 22
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT

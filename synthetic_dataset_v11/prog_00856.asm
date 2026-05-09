; DESCRIPTION: Draws a blue circle centered at (145, 203) with radius 11.
; PLAN: r0=145(x), r1=203(y), r2=11(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 145
LDI r1, 203
LDI r2, 11
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT

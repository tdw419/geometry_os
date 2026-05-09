; DESCRIPTION: Draws a blue circle centered at (203, 106) with radius 16.
; PLAN: r0=203(x), r1=106(y), r2=16(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 203
LDI r1, 106
LDI r2, 16
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT

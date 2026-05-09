; DESCRIPTION: Draws a blue circle centered at (454, 12) with radius 10.
; PLAN: r0=454(x), r1=12(y), r2=10(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 454
LDI r1, 12
LDI r2, 10
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT

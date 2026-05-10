; DESCRIPTION: Draws a blue circle centered at (354, 69) with radius 10.
; PLAN: r0=354(x), r1=69(y), r2=10(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 354
LDI r1, 69
LDI r2, 10
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT

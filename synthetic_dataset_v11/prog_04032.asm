; DESCRIPTION: Draws a blue circle centered at (159, 100) with radius 56.
; PLAN: r0=159(x), r1=100(y), r2=56(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 159
LDI r1, 100
LDI r2, 56
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT

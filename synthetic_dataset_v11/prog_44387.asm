; DESCRIPTION: Draws a blue circle centered at (87, 100) with radius 19.
; PLAN: r0=87(x), r1=100(y), r2=19(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 87
LDI r1, 100
LDI r2, 19
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT

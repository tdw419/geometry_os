; DESCRIPTION: Draws a blue circle centered at (234, 99) with radius 37.
; PLAN: r0=234(x), r1=99(y), r2=37(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 234
LDI r1, 99
LDI r2, 37
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT

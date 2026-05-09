; DESCRIPTION: Draws a blue circle centered at (234, 191) with radius 10.
; PLAN: r0=234(x), r1=191(y), r2=10(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 234
LDI r1, 191
LDI r2, 10
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT

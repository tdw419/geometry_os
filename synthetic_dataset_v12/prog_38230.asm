; DESCRIPTION: Draws a blue circle centered at (448, 191) with radius 45.
; PLAN: r0=448(x), r1=191(y), r2=45(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 448
LDI r1, 191
LDI r2, 45
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT

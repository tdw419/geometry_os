; DESCRIPTION: Draws a blue circle centered at (289, 45) with radius 57.
; PLAN: r0=289(x), r1=45(y), r2=57(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 289
LDI r1, 45
LDI r2, 57
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT

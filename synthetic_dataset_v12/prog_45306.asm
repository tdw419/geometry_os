; DESCRIPTION: Draws a blue circle centered at (289, 127) with radius 80.
; PLAN: r0=289(x), r1=127(y), r2=80(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 289
LDI r1, 127
LDI r2, 80
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT

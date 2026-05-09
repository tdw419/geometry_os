; DESCRIPTION: Places a blue circle of radius 11 at center (289, 144).
; PLAN: r0=289(x), r1=144(y), r2=11(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 289
LDI r1, 144
LDI r2, 11
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT

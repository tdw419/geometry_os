; DESCRIPTION: Places a purple circle of radius 66 at center (389, 144).
; PLAN: r0=389(x), r1=144(y), r2=66(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 389
LDI r1, 144
LDI r2, 66
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

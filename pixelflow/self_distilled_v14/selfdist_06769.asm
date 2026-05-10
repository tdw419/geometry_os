; DESCRIPTION: Places a blue disk with center (201, 81) and radius 71.
; PLAN: r0=201(x), r1=81(y), r2=71(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 201
LDI r1, 81
LDI r2, 71
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT

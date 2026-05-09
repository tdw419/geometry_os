; DESCRIPTION: Places a purple circle of radius 80 at center (201, 168).
; PLAN: r0=201(x), r1=168(y), r2=80(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 201
LDI r1, 168
LDI r2, 80
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

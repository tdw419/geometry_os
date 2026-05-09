; DESCRIPTION: Places a blue circle of radius 34 at center (201, 93).
; PLAN: r0=201(x), r1=93(y), r2=34(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 201
LDI r1, 93
LDI r2, 34
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT

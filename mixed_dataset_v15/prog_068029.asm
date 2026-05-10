; DESCRIPTION: Places a yellow circle of radius 48 at center (201, 106).
; PLAN: r0=201(x), r1=106(y), r2=48(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 201
LDI r1, 106
LDI r2, 48
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT

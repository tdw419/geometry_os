; DESCRIPTION: Places a magenta circle of radius 29 at center (133, 201).
; PLAN: r0=133(x), r1=201(y), r2=29(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 133
LDI r1, 201
LDI r2, 29
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT

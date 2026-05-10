; DESCRIPTION: Places a purple circle of radius 21 at center (448, 109).
; PLAN: r0=448(x), r1=109(y), r2=21(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 448
LDI r1, 109
LDI r2, 21
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

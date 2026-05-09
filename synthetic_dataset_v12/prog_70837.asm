; DESCRIPTION: Places a purple circle of radius 39 at center (448, 51).
; PLAN: r0=448(x), r1=51(y), r2=39(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 448
LDI r1, 51
LDI r2, 39
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

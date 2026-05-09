; DESCRIPTION: Places a purple circle of radius 51 at center (377, 160).
; PLAN: r0=377(x), r1=160(y), r2=51(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 377
LDI r1, 160
LDI r2, 51
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

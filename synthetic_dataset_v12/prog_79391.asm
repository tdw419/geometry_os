; DESCRIPTION: Places a purple circle of radius 51 at center (135, 104).
; PLAN: r0=135(x), r1=104(y), r2=51(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 135
LDI r1, 104
LDI r2, 51
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

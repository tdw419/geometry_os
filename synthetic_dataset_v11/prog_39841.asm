; DESCRIPTION: Places a purple circle of radius 74 at center (104, 110).
; PLAN: r0=104(x), r1=110(y), r2=74(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 104
LDI r1, 110
LDI r2, 74
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

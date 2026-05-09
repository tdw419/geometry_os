; DESCRIPTION: Places a purple circle of radius 35 at center (288, 104).
; PLAN: r0=288(x), r1=104(y), r2=35(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 288
LDI r1, 104
LDI r2, 35
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

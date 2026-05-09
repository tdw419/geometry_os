; DESCRIPTION: Places a purple circle of radius 34 at center (134, 104).
; PLAN: r0=134(x), r1=104(y), r2=34(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 134
LDI r1, 104
LDI r2, 34
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

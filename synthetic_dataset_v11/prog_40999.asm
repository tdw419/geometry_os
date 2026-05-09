; DESCRIPTION: Places a purple circle of radius 14 at center (200, 203).
; PLAN: r0=200(x), r1=203(y), r2=14(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 200
LDI r1, 203
LDI r2, 14
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

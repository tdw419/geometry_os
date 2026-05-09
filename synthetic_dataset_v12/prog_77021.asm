; DESCRIPTION: Places a purple circle of radius 46 at center (200, 52).
; PLAN: r0=200(x), r1=52(y), r2=46(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 200
LDI r1, 52
LDI r2, 46
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

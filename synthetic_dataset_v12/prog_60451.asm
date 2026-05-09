; DESCRIPTION: Places a purple circle of radius 38 at center (372, 80).
; PLAN: r0=372(x), r1=80(y), r2=38(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 372
LDI r1, 80
LDI r2, 38
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

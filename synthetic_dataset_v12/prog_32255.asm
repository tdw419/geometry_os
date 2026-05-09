; DESCRIPTION: Places a purple circle of radius 11 at center (305, 119).
; PLAN: r0=305(x), r1=119(y), r2=11(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 305
LDI r1, 119
LDI r2, 11
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

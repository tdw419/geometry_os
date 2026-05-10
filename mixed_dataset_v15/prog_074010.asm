; DESCRIPTION: Places a purple circle of radius 25 at center (193, 119).
; PLAN: r0=193(x), r1=119(y), r2=25(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 193
LDI r1, 119
LDI r2, 25
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

; DESCRIPTION: Places a purple circle of radius 34 at center (220, 119).
; PLAN: r0=220(x), r1=119(y), r2=34(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 220
LDI r1, 119
LDI r2, 34
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

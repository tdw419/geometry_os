; DESCRIPTION: Places a purple disk with center (119, 22) and radius 25.
; PLAN: r0=119(x), r1=22(y), r2=25(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 119
LDI r1, 22
LDI r2, 25
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

; DESCRIPTION: Places a purple disk with center (390, 160) and radius 16.
; PLAN: r0=390(x), r1=160(y), r2=16(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 390
LDI r1, 160
LDI r2, 16
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

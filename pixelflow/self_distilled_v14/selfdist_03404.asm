; DESCRIPTION: Places a purple disk with center (219, 80) and radius 10.
; PLAN: r0=219(x), r1=80(y), r2=10(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 219
LDI r1, 80
LDI r2, 10
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

; DESCRIPTION: Places a purple circle of radius 80 at center (96, 105).
; PLAN: r0=96(x), r1=105(y), r2=80(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 96
LDI r1, 105
LDI r2, 80
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

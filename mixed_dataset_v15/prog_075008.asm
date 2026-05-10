; DESCRIPTION: Places a blue disk with center (133, 83) and radius 23.
; PLAN: r0=133(x), r1=83(y), r2=23(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 133
LDI r1, 83
LDI r2, 23
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT

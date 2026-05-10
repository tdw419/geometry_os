; DESCRIPTION: Places a blue disk with center (200, 23) and radius 20.
; PLAN: r0=200(x), r1=23(y), r2=20(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 200
LDI r1, 23
LDI r2, 20
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT

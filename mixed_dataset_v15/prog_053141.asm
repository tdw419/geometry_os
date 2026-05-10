; DESCRIPTION: Places a blue disk with center (76, 105) and radius 20.
; PLAN: r0=76(x), r1=105(y), r2=20(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 76
LDI r1, 105
LDI r2, 20
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT

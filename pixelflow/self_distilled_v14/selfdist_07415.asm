; DESCRIPTION: Places a blue disk with center (158, 124) and radius 13.
; PLAN: r0=158(x), r1=124(y), r2=13(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 158
LDI r1, 124
LDI r2, 13
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT

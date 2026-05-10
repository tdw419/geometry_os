; DESCRIPTION: Places a blue disk with center (99, 56) and radius 74.
; PLAN: r0=99(x), r1=56(y), r2=74(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 99
LDI r1, 56
LDI r2, 74
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT

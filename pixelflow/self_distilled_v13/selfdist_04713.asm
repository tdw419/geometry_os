; DESCRIPTION: Places a blue disk with center (356, 159) and radius 18.
; PLAN: r0=356(x), r1=159(y), r2=18(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 356
LDI r1, 159
LDI r2, 18
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT

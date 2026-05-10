; DESCRIPTION: Places a blue disk with center (338, 109) and radius 17.
; PLAN: r0=338(x), r1=109(y), r2=17(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 338
LDI r1, 109
LDI r2, 17
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT

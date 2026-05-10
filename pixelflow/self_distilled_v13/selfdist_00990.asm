; DESCRIPTION: Places a blue disk with center (325, 19) and radius 55.
; PLAN: r0=325(x), r1=19(y), r2=55(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 325
LDI r1, 19
LDI r2, 55
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT

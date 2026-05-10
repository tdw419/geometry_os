; DESCRIPTION: Places a blue disk with center (338, 160) and radius 47.
; PLAN: r0=338(x), r1=160(y), r2=47(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 338
LDI r1, 160
LDI r2, 47
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT

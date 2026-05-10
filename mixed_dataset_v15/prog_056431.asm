; DESCRIPTION: Places a purple disk with center (351, 21) and radius 11.
; PLAN: r0=351(x), r1=21(y), r2=11(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 351
LDI r1, 21
LDI r2, 11
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

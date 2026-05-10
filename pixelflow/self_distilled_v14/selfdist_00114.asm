; DESCRIPTION: Places a purple disk with center (122, 45) and radius 36.
; PLAN: r0=122(x), r1=45(y), r2=36(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 122
LDI r1, 45
LDI r2, 36
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

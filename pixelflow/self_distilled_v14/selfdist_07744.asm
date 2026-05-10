; DESCRIPTION: Places a purple disk with center (164, 155) and radius 49.
; PLAN: r0=164(x), r1=155(y), r2=49(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 164
LDI r1, 155
LDI r2, 49
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

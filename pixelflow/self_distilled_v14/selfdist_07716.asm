; DESCRIPTION: Places a purple disk with center (99, 191) and radius 73.
; PLAN: r0=99(x), r1=191(y), r2=73(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 99
LDI r1, 191
LDI r2, 73
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

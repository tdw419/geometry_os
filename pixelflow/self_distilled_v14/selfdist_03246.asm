; DESCRIPTION: Places a purple disk with center (293, 131) and radius 31.
; PLAN: r0=293(x), r1=131(y), r2=31(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 293
LDI r1, 131
LDI r2, 31
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

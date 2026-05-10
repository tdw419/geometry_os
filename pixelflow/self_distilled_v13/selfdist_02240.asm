; DESCRIPTION: Places a purple disk with center (34, 0) and radius 36.
; PLAN: r0=34(x), r1=0(y), r2=36(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 34
LDI r1, 0
LDI r2, 36
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

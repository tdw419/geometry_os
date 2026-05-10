; DESCRIPTION: Places a purple disk with center (101, 6) and radius 30.
; PLAN: r0=101(x), r1=6(y), r2=30(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 101
LDI r1, 6
LDI r2, 30
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

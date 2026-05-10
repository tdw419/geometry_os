; DESCRIPTION: Places a purple disk with center (28, 22) and radius 34.
; PLAN: r0=28(x), r1=22(y), r2=34(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 28
LDI r1, 22
LDI r2, 34
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

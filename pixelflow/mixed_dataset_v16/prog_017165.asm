; DESCRIPTION: Places a purple disk with center (33, 144) and radius 34.
; PLAN: r0=33(x), r1=144(y), r2=34(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 33
LDI r1, 144
LDI r2, 34
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

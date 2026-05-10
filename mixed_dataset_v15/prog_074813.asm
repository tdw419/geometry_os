; DESCRIPTION: Places a purple disk with center (34, 175) and radius 79.
; PLAN: r0=34(x), r1=175(y), r2=79(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 34
LDI r1, 175
LDI r2, 79
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

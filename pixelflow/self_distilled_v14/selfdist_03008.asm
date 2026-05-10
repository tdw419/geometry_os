; DESCRIPTION: Places a purple disk with center (158, 175) and radius 15.
; PLAN: r0=158(x), r1=175(y), r2=15(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 158
LDI r1, 175
LDI r2, 15
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

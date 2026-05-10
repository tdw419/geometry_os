; DESCRIPTION: Places a purple disk with center (195, 175) and radius 70.
; PLAN: r0=195(x), r1=175(y), r2=70(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 195
LDI r1, 175
LDI r2, 70
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

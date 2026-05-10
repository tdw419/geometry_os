; DESCRIPTION: Places a purple disk with center (116, 122) and radius 22.
; PLAN: r0=116(x), r1=122(y), r2=22(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 116
LDI r1, 122
LDI r2, 22
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

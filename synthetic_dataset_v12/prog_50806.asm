; DESCRIPTION: Places a purple circle of radius 21 at center (133, 114).
; PLAN: r0=133(x), r1=114(y), r2=21(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 133
LDI r1, 114
LDI r2, 21
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

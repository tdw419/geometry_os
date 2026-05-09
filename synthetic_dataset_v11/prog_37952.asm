; DESCRIPTION: Places a purple circle of radius 14 at center (122, 79).
; PLAN: r0=122(x), r1=79(y), r2=14(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 122
LDI r1, 79
LDI r2, 14
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

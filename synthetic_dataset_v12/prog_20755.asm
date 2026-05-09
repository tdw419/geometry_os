; DESCRIPTION: Places a purple circle of radius 12 at center (316, 76).
; PLAN: r0=316(x), r1=76(y), r2=12(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 316
LDI r1, 76
LDI r2, 12
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

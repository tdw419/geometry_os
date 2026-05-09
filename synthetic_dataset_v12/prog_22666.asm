; DESCRIPTION: Places a purple circle of radius 76 at center (276, 105).
; PLAN: r0=276(x), r1=105(y), r2=76(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 276
LDI r1, 105
LDI r2, 76
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

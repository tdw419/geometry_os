; DESCRIPTION: Places a purple circle of radius 33 at center (98, 191).
; PLAN: r0=98(x), r1=191(y), r2=33(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 98
LDI r1, 191
LDI r2, 33
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

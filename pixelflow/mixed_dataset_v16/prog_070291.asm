; DESCRIPTION: Places a purple circle of radius 34 at center (258, 99).
; PLAN: r0=258(x), r1=99(y), r2=34(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 258
LDI r1, 99
LDI r2, 34
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

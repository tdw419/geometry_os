; DESCRIPTION: Places a purple circle of radius 66 at center (99, 176).
; PLAN: r0=99(x), r1=176(y), r2=66(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 99
LDI r1, 176
LDI r2, 66
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

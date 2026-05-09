; DESCRIPTION: Places a purple circle of radius 37 at center (101, 105).
; PLAN: r0=101(x), r1=105(y), r2=37(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 101
LDI r1, 105
LDI r2, 37
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

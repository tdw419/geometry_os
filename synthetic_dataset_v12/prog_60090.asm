; DESCRIPTION: Places a purple circle of radius 37 at center (137, 162).
; PLAN: r0=137(x), r1=162(y), r2=37(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 137
LDI r1, 162
LDI r2, 37
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

; DESCRIPTION: Places a purple circle of radius 29 at center (88, 137).
; PLAN: r0=88(x), r1=137(y), r2=29(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 88
LDI r1, 137
LDI r2, 29
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

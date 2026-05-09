; DESCRIPTION: Places a purple circle of radius 69 at center (222, 137).
; PLAN: r0=222(x), r1=137(y), r2=69(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 222
LDI r1, 137
LDI r2, 69
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

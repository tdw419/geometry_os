; DESCRIPTION: Places a purple circle of radius 13 at center (222, 178).
; PLAN: r0=222(x), r1=178(y), r2=13(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 222
LDI r1, 178
LDI r2, 13
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

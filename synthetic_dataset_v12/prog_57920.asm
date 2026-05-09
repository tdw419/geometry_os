; DESCRIPTION: Places a purple circle of radius 25 at center (31, 222).
; PLAN: r0=31(x), r1=222(y), r2=25(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 31
LDI r1, 222
LDI r2, 25
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

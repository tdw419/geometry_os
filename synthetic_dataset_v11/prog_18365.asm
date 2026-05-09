; DESCRIPTION: Places a purple circle of radius 17 at center (227, 178).
; PLAN: r0=227(x), r1=178(y), r2=17(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 227
LDI r1, 178
LDI r2, 17
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

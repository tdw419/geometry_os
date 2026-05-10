; DESCRIPTION: Places a purple circle of radius 44 at center (283, 183).
; PLAN: r0=283(x), r1=183(y), r2=44(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 283
LDI r1, 183
LDI r2, 44
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

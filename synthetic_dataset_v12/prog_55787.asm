; DESCRIPTION: Places a purple circle of radius 66 at center (381, 135).
; PLAN: r0=381(x), r1=135(y), r2=66(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 381
LDI r1, 135
LDI r2, 66
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

; DESCRIPTION: Places a purple circle of radius 43 at center (44, 147).
; PLAN: r0=44(x), r1=147(y), r2=43(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 44
LDI r1, 147
LDI r2, 43
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

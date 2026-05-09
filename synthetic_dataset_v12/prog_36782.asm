; DESCRIPTION: Places a purple circle of radius 15 at center (46, 142).
; PLAN: r0=46(x), r1=142(y), r2=15(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 46
LDI r1, 142
LDI r2, 15
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

; DESCRIPTION: Places a purple circle of radius 79 at center (213, 130).
; PLAN: r0=213(x), r1=130(y), r2=79(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 213
LDI r1, 130
LDI r2, 79
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

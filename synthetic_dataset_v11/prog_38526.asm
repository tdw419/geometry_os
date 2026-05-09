; DESCRIPTION: Places a purple circle of radius 67 at center (124, 176).
; PLAN: r0=124(x), r1=176(y), r2=67(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 124
LDI r1, 176
LDI r2, 67
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

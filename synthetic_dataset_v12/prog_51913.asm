; DESCRIPTION: Places a purple circle of radius 67 at center (373, 82).
; PLAN: r0=373(x), r1=82(y), r2=67(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 373
LDI r1, 82
LDI r2, 67
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

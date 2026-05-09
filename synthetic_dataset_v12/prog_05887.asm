; DESCRIPTION: Places a purple circle of radius 56 at center (294, 67).
; PLAN: r0=294(x), r1=67(y), r2=56(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 294
LDI r1, 67
LDI r2, 56
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

; DESCRIPTION: Places a purple circle of radius 42 at center (226, 67).
; PLAN: r0=226(x), r1=67(y), r2=42(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 226
LDI r1, 67
LDI r2, 42
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

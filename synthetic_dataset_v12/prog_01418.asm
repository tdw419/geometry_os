; DESCRIPTION: Places a purple circle of radius 67 at center (135, 172).
; PLAN: r0=135(x), r1=172(y), r2=67(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 135
LDI r1, 172
LDI r2, 67
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

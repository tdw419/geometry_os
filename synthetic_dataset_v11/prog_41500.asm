; DESCRIPTION: Places a purple circle of radius 64 at center (124, 76).
; PLAN: r0=124(x), r1=76(y), r2=64(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 124
LDI r1, 76
LDI r2, 64
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

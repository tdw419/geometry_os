; DESCRIPTION: Places a purple circle of radius 73 at center (274, 77).
; PLAN: r0=274(x), r1=77(y), r2=73(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 274
LDI r1, 77
LDI r2, 73
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

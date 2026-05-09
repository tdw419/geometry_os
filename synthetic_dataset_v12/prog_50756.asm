; DESCRIPTION: Places a purple circle of radius 33 at center (269, 116).
; PLAN: r0=269(x), r1=116(y), r2=33(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 269
LDI r1, 116
LDI r2, 33
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

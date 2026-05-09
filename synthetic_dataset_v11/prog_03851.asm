; DESCRIPTION: Places a yellow circle of radius 36 at center (194, 116).
; PLAN: r0=194(x), r1=116(y), r2=36(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 194
LDI r1, 116
LDI r2, 36
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT

; DESCRIPTION: Places a yellow circle of radius 58 at center (101, 116).
; PLAN: r0=101(x), r1=116(y), r2=58(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 101
LDI r1, 116
LDI r2, 58
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT

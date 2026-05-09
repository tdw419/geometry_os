; DESCRIPTION: Places a red circle of radius 56 at center (454, 116).
; PLAN: r0=454(x), r1=116(y), r2=56(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 454
LDI r1, 116
LDI r2, 56
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

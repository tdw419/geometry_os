; DESCRIPTION: Creates a purple circular shape at (116, 92) with radius 28.
; PLAN: r0=116(x), r1=92(y), r2=28(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 116
LDI r1, 92
LDI r2, 28
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

; DESCRIPTION: Creates a purple circular shape at (228, 92) with radius 29.
; PLAN: r0=228(x), r1=92(y), r2=29(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 228
LDI r1, 92
LDI r2, 29
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

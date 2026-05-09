; DESCRIPTION: Creates a purple circular shape at (294, 116) with radius 74.
; PLAN: r0=294(x), r1=116(y), r2=74(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 294
LDI r1, 116
LDI r2, 74
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

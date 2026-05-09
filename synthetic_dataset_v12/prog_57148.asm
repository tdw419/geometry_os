; DESCRIPTION: Creates a purple circular shape at (376, 152) with radius 39.
; PLAN: r0=376(x), r1=152(y), r2=39(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 376
LDI r1, 152
LDI r2, 39
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

; DESCRIPTION: Creates a purple circular shape at (135, 57) with radius 12.
; PLAN: r0=135(x), r1=57(y), r2=12(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 135
LDI r1, 57
LDI r2, 12
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

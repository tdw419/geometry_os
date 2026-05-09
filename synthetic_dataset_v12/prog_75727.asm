; DESCRIPTION: Creates a purple circular shape at (373, 171) with radius 56.
; PLAN: r0=373(x), r1=171(y), r2=56(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 373
LDI r1, 171
LDI r2, 56
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

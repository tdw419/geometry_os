; DESCRIPTION: Creates a blue circular shape at (373, 57) with radius 45.
; PLAN: r0=373(x), r1=57(y), r2=45(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 373
LDI r1, 57
LDI r2, 45
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT

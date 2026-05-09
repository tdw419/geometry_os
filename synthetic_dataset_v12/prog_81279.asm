; DESCRIPTION: Creates a blue circular shape at (335, 102) with radius 57.
; PLAN: r0=335(x), r1=102(y), r2=57(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 335
LDI r1, 102
LDI r2, 57
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT

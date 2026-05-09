; DESCRIPTION: Creates a purple circular shape at (467, 59) with radius 37.
; PLAN: r0=467(x), r1=59(y), r2=37(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 467
LDI r1, 59
LDI r2, 37
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

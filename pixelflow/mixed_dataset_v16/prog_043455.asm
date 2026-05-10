; DESCRIPTION: Creates a blue circular shape at (142, 145) with radius 71.
; PLAN: r0=142(x), r1=145(y), r2=71(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 142
LDI r1, 145
LDI r2, 71
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT

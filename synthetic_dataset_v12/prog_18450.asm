; DESCRIPTION: Creates a blue circular shape at (318, 169) with radius 78.
; PLAN: r0=318(x), r1=169(y), r2=78(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 318
LDI r1, 169
LDI r2, 78
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT

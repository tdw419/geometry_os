; DESCRIPTION: Creates a blue circular shape at (351, 163) with radius 27.
; PLAN: r0=351(x), r1=163(y), r2=27(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 351
LDI r1, 163
LDI r2, 27
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT

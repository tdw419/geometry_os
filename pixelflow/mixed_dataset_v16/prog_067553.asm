; DESCRIPTION: Places a red circle of radius 14 at center (351, 145).
; PLAN: r0=351(x), r1=145(y), r2=14(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 351
LDI r1, 145
LDI r2, 14
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

; DESCRIPTION: Places a red circle of radius 36 at center (119, 145).
; PLAN: r0=119(x), r1=145(y), r2=36(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 119
LDI r1, 145
LDI r2, 36
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

; DESCRIPTION: Places a red circle of radius 60 at center (194, 145).
; PLAN: r0=194(x), r1=145(y), r2=60(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 194
LDI r1, 145
LDI r2, 60
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

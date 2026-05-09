; DESCRIPTION: Creates a red circular shape at (448, 158) with radius 45.
; PLAN: r0=448(x), r1=158(y), r2=45(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 448
LDI r1, 158
LDI r2, 45
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

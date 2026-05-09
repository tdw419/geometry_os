; DESCRIPTION: Places a red circle of radius 20 at center (83, 233).
; PLAN: r0=83(x), r1=233(y), r2=20(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 83
LDI r1, 233
LDI r2, 20
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

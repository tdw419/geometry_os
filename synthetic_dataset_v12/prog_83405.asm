; DESCRIPTION: Places a red circle of radius 78 at center (105, 80).
; PLAN: r0=105(x), r1=80(y), r2=78(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 105
LDI r1, 80
LDI r2, 78
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

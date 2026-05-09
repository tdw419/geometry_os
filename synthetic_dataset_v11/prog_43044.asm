; DESCRIPTION: Places a red circle of radius 74 at center (93, 102).
; PLAN: r0=93(x), r1=102(y), r2=74(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 93
LDI r1, 102
LDI r2, 74
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

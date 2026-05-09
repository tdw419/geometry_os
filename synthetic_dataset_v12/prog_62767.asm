; DESCRIPTION: Places a red circle of radius 57 at center (102, 99).
; PLAN: r0=102(x), r1=99(y), r2=57(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 102
LDI r1, 99
LDI r2, 57
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

; DESCRIPTION: Places a red circle of radius 31 at center (163, 121).
; PLAN: r0=163(x), r1=121(y), r2=31(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 163
LDI r1, 121
LDI r2, 31
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

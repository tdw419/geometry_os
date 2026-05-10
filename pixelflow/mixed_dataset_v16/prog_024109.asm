; DESCRIPTION: Places a red circle of radius 35 at center (314, 186).
; PLAN: r0=314(x), r1=186(y), r2=35(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 314
LDI r1, 186
LDI r2, 35
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

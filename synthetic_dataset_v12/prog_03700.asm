; DESCRIPTION: Places a red circle of radius 73 at center (323, 141).
; PLAN: r0=323(x), r1=141(y), r2=73(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 323
LDI r1, 141
LDI r2, 73
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

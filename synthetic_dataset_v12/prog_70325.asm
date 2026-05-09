; DESCRIPTION: Places a red circle of radius 12 at center (186, 31).
; PLAN: r0=186(x), r1=31(y), r2=12(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 186
LDI r1, 31
LDI r2, 12
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

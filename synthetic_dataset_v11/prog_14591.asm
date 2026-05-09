; DESCRIPTION: Places a red circle of radius 61 at center (188, 106).
; PLAN: r0=188(x), r1=106(y), r2=61(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 188
LDI r1, 106
LDI r2, 61
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

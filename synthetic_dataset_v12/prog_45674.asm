; DESCRIPTION: Places a red circle of radius 22 at center (273, 140).
; PLAN: r0=273(x), r1=140(y), r2=22(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 273
LDI r1, 140
LDI r2, 22
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

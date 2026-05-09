; DESCRIPTION: Places a red circle of radius 49 at center (177, 99).
; PLAN: r0=177(x), r1=99(y), r2=49(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 177
LDI r1, 99
LDI r2, 49
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

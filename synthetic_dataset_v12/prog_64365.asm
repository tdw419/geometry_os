; DESCRIPTION: Places a red circle of radius 66 at center (140, 129).
; PLAN: r0=140(x), r1=129(y), r2=66(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 140
LDI r1, 129
LDI r2, 66
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

; DESCRIPTION: Places a red circle of radius 78 at center (112, 140).
; PLAN: r0=112(x), r1=140(y), r2=78(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 112
LDI r1, 140
LDI r2, 78
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

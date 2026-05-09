; DESCRIPTION: Places a red circle of radius 77 at center (140, 170).
; PLAN: r0=140(x), r1=170(y), r2=77(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 140
LDI r1, 170
LDI r2, 77
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

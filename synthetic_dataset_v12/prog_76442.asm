; DESCRIPTION: Places a red circle of radius 34 at center (469, 140).
; PLAN: r0=469(x), r1=140(y), r2=34(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 469
LDI r1, 140
LDI r2, 34
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

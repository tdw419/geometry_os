; DESCRIPTION: Places a red circle of radius 71 at center (142, 149).
; PLAN: r0=142(x), r1=149(y), r2=71(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 142
LDI r1, 149
LDI r2, 71
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

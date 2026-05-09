; DESCRIPTION: Places a red circle of radius 26 at center (71, 226).
; PLAN: r0=71(x), r1=226(y), r2=26(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 71
LDI r1, 226
LDI r2, 26
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

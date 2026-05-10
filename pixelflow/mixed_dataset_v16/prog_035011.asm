; DESCRIPTION: Places a red circle of radius 53 at center (216, 58).
; PLAN: r0=216(x), r1=58(y), r2=53(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 216
LDI r1, 58
LDI r2, 53
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

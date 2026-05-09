; DESCRIPTION: Places a red circle of radius 49 at center (225, 58).
; PLAN: r0=225(x), r1=58(y), r2=49(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 225
LDI r1, 58
LDI r2, 49
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

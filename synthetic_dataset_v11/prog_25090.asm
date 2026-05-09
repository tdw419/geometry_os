; DESCRIPTION: Places a yellow circle of radius 49 at center (194, 207).
; PLAN: r0=194(x), r1=207(y), r2=49(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 194
LDI r1, 207
LDI r2, 49
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT

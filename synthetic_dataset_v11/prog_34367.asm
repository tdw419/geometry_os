; DESCRIPTION: Places a yellow circle of radius 53 at center (137, 187).
; PLAN: r0=137(x), r1=187(y), r2=53(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 137
LDI r1, 187
LDI r2, 53
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT

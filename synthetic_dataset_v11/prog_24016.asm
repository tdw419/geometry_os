; DESCRIPTION: Places a yellow circle of radius 55 at center (137, 157).
; PLAN: r0=137(x), r1=157(y), r2=55(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 137
LDI r1, 157
LDI r2, 55
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT

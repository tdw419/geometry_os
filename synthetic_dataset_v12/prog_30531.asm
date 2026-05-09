; DESCRIPTION: Places a yellow circle of radius 55 at center (344, 139).
; PLAN: r0=344(x), r1=139(y), r2=55(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 344
LDI r1, 139
LDI r2, 55
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT

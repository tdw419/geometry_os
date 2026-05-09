; DESCRIPTION: Places a yellow circle of radius 66 at center (406, 78).
; PLAN: r0=406(x), r1=78(y), r2=66(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 406
LDI r1, 78
LDI r2, 66
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT

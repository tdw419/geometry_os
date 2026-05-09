; DESCRIPTION: Places a yellow circle of radius 13 at center (406, 225).
; PLAN: r0=406(x), r1=225(y), r2=13(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 406
LDI r1, 225
LDI r2, 13
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT

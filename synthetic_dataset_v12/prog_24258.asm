; DESCRIPTION: Places a yellow circle of radius 14 at center (55, 110).
; PLAN: r0=55(x), r1=110(y), r2=14(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 55
LDI r1, 110
LDI r2, 14
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT

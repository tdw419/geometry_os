; DESCRIPTION: Places a yellow circle of radius 34 at center (49, 65).
; PLAN: r0=49(x), r1=65(y), r2=34(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 49
LDI r1, 65
LDI r2, 34
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT

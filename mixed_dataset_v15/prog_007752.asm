; DESCRIPTION: Places a yellow circle of radius 33 at center (78, 106).
; PLAN: r0=78(x), r1=106(y), r2=33(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 78
LDI r1, 106
LDI r2, 33
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT

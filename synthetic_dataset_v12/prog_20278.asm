; DESCRIPTION: Places a green circle of radius 34 at center (162, 78).
; PLAN: r0=162(x), r1=78(y), r2=34(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 162
LDI r1, 78
LDI r2, 34
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT

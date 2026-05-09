; DESCRIPTION: Places a green circle of radius 34 at center (88, 85).
; PLAN: r0=88(x), r1=85(y), r2=34(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 88
LDI r1, 85
LDI r2, 34
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT

; DESCRIPTION: Places a green circle of radius 35 at center (462, 77).
; PLAN: r0=462(x), r1=77(y), r2=35(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 462
LDI r1, 77
LDI r2, 35
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT

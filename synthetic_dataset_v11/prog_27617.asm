; DESCRIPTION: Places a green circle of radius 60 at center (88, 66).
; PLAN: r0=88(x), r1=66(y), r2=60(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 88
LDI r1, 66
LDI r2, 60
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT

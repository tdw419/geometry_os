; DESCRIPTION: Places a green circle of radius 49 at center (125, 114).
; PLAN: r0=125(x), r1=114(y), r2=49(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 125
LDI r1, 114
LDI r2, 49
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT

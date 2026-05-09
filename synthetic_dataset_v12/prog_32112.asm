; DESCRIPTION: Places a green circle of radius 66 at center (98, 158).
; PLAN: r0=98(x), r1=158(y), r2=66(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 98
LDI r1, 158
LDI r2, 66
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT

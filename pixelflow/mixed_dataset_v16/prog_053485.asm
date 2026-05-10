; DESCRIPTION: Places a green circle of radius 12 at center (399, 66).
; PLAN: r0=399(x), r1=66(y), r2=12(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 399
LDI r1, 66
LDI r2, 12
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT

; DESCRIPTION: Places a green circle of radius 77 at center (159, 78).
; PLAN: r0=159(x), r1=78(y), r2=77(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 159
LDI r1, 78
LDI r2, 77
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT

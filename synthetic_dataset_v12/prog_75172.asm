; DESCRIPTION: Places a green circle of radius 78 at center (159, 177).
; PLAN: r0=159(x), r1=177(y), r2=78(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 159
LDI r1, 177
LDI r2, 78
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT

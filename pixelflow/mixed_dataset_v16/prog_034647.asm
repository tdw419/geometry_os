; DESCRIPTION: Places a green disk with center (159, 98) and radius 47.
; PLAN: r0=159(x), r1=98(y), r2=47(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 159
LDI r1, 98
LDI r2, 47
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT

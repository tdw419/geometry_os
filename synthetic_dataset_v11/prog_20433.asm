; DESCRIPTION: Renders a green disk with center (159, 54) and radius 26.
; PLAN: r0=159(x), r1=54(y), r2=26(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 159
LDI r1, 54
LDI r2, 26
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT

; DESCRIPTION: Renders a green disk with center (453, 159) and radius 44.
; PLAN: r0=453(x), r1=159(y), r2=44(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 453
LDI r1, 159
LDI r2, 44
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT

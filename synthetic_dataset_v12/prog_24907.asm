; DESCRIPTION: Renders a green disk with center (151, 159) and radius 66.
; PLAN: r0=151(x), r1=159(y), r2=66(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 151
LDI r1, 159
LDI r2, 66
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT

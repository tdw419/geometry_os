; DESCRIPTION: Renders a yellow disk with center (265, 159) and radius 37.
; PLAN: r0=265(x), r1=159(y), r2=37(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 265
LDI r1, 159
LDI r2, 37
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT

; DESCRIPTION: Renders a green disk with center (172, 114) and radius 44.
; PLAN: r0=172(x), r1=114(y), r2=44(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 172
LDI r1, 114
LDI r2, 44
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT

; DESCRIPTION: Renders a green disk with center (88, 114) and radius 25.
; PLAN: r0=88(x), r1=114(y), r2=25(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 88
LDI r1, 114
LDI r2, 25
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT

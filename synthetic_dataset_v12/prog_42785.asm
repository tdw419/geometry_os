; DESCRIPTION: Renders a green disk with center (25, 153) and radius 17.
; PLAN: r0=25(x), r1=153(y), r2=17(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 25
LDI r1, 153
LDI r2, 17
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT

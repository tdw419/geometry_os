; DESCRIPTION: Renders a green disk with center (227, 196) and radius 18.
; PLAN: r0=227(x), r1=196(y), r2=18(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 227
LDI r1, 196
LDI r2, 18
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT

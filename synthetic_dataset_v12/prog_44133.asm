; DESCRIPTION: Renders a green disk with center (172, 78) and radius 18.
; PLAN: r0=172(x), r1=78(y), r2=18(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 172
LDI r1, 78
LDI r2, 18
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT

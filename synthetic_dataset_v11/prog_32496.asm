; DESCRIPTION: Renders a black disk with center (112, 129) and radius 66.
; PLAN: r0=112(x), r1=129(y), r2=66(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 112
LDI r1, 129
LDI r2, 66
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT

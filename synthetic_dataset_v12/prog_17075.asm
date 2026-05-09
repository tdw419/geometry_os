; DESCRIPTION: Renders a white disk with center (247, 78) and radius 46.
; PLAN: r0=247(x), r1=78(y), r2=46(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 247
LDI r1, 78
LDI r2, 46
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT

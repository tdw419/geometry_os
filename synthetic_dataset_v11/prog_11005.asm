; DESCRIPTION: Renders a white disk with center (86, 174) and radius 43.
; PLAN: r0=86(x), r1=174(y), r2=43(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 86
LDI r1, 174
LDI r2, 43
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT

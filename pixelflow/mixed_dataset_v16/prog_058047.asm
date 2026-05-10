; DESCRIPTION: Renders a white disk with center (37, 191) and radius 11.
; PLAN: r0=37(x), r1=191(y), r2=11(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 37
LDI r1, 191
LDI r2, 11
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT

; DESCRIPTION: Renders a white disk with center (36, 86) and radius 21.
; PLAN: r0=36(x), r1=86(y), r2=21(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 36
LDI r1, 86
LDI r2, 21
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT

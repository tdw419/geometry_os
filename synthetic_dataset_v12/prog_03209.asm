; DESCRIPTION: Renders a white disk with center (298, 130) and radius 53.
; PLAN: r0=298(x), r1=130(y), r2=53(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 298
LDI r1, 130
LDI r2, 53
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT

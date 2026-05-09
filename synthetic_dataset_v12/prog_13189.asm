; DESCRIPTION: Renders a black disk with center (447, 130) and radius 10.
; PLAN: r0=447(x), r1=130(y), r2=10(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 447
LDI r1, 130
LDI r2, 10
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT

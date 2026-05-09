; DESCRIPTION: Renders a black disk with center (395, 130) and radius 72.
; PLAN: r0=395(x), r1=130(y), r2=72(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 395
LDI r1, 130
LDI r2, 72
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT

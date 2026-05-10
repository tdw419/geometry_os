; DESCRIPTION: Renders a black disk with center (400, 210) and radius 28.
; PLAN: r0=400(x), r1=210(y), r2=28(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 400
LDI r1, 210
LDI r2, 28
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT

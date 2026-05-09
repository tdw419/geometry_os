; DESCRIPTION: Creates a black circular shape at (446, 130) with radius 58.
; PLAN: r0=446(x), r1=130(y), r2=58(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 446
LDI r1, 130
LDI r2, 58
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT

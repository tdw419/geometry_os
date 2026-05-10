; DESCRIPTION: Draws a cyan circle centered at (478, 130) with radius 30.
; PLAN: r0=478(x), r1=130(y), r2=30(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 478
LDI r1, 130
LDI r2, 30
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT

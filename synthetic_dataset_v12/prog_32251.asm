; DESCRIPTION: Renders a black disk with center (291, 195) and radius 15.
; PLAN: r0=291(x), r1=195(y), r2=15(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 291
LDI r1, 195
LDI r2, 15
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT

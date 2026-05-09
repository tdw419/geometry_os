; DESCRIPTION: Composite: Renders a black disk with center (254, 86) and radius 67 then Sets a single white pixel at (121, 158).
; PLAN: r0=254(x), r1=86(y), r2=67(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=121(x), r6=158(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 254
LDI r1, 86
LDI r2, 67
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 121
LDI r6, 158
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT

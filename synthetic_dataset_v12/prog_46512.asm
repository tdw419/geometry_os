; DESCRIPTION: Composite: Creates a green circular shape at (254, 55) with radius 37 then Sets a single blue pixel at (488, 170).
; PLAN: r0=254(x), r1=55(y), r2=37(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=488(x), r6=170(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 254
LDI r1, 55
LDI r2, 37
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 488
LDI r6, 170
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT

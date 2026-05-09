; DESCRIPTION: Composite: Places a black circle of radius 78 at center (266, 130) then Sets a single yellow pixel at (78, 4).
; PLAN: r0=266(x), r1=130(y), r2=78(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=78(x), r6=4(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 266
LDI r1, 130
LDI r2, 78
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 78
LDI r6, 4
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT

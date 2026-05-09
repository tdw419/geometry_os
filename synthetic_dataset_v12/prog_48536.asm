; DESCRIPTION: Composite: Creates a black circular shape at (121, 72) with radius 32 then Sets a single green pixel at (20, 71).
; PLAN: r0=121(x), r1=72(y), r2=32(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=20(x), r6=71(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 121
LDI r1, 72
LDI r2, 32
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 20
LDI r6, 71
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT

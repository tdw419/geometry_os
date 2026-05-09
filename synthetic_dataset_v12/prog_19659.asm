; DESCRIPTION: Composite: Creates a white circular shape at (298, 198) with radius 43 then Sets a single blue pixel at (11, 187).
; PLAN: r0=298(x), r1=198(y), r2=43(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=11(x), r6=187(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 298
LDI r1, 198
LDI r2, 43
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 11
LDI r6, 187
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT

; DESCRIPTION: Composite: Creates a black circular shape at (252, 87) with radius 74 then Places a yellow dot at position (335, 19).
; PLAN: r0=252(x), r1=87(y), r2=74(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=335(x), r6=19(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 252
LDI r1, 87
LDI r2, 74
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 335
LDI r6, 19
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT

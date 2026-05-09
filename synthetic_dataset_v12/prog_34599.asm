; DESCRIPTION: Composite: Sets a single black pixel at (272, 44) then Renders a black disk with center (418, 96) and radius 42.
; PLAN: r0=272(x), r1=44(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=418(x), r6=96(y), r7=42(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 272
LDI r1, 44
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 418
LDI r6, 96
LDI r7, 42
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT

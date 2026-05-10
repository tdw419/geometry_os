; DESCRIPTION: Composite: Places a black dot at position (483, 202) then Draws a orange circle centered at (289, 129) with radius 11.
; PLAN: r0=483(x), r1=202(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=289(x), r6=129(y), r7=11(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 483
LDI r1, 202
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 289
LDI r6, 129
LDI r7, 11
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT

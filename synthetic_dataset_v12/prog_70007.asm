; DESCRIPTION: Composite: Sets a single black pixel at (16, 236) then Creates a orange circular shape at (261, 132) with radius 58.
; PLAN: r0=16(x), r1=236(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=261(x), r6=132(y), r7=58(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 16
LDI r1, 236
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 261
LDI r6, 132
LDI r7, 58
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT

; DESCRIPTION: Composite: Places a yellow dot at position (364, 254) then Creates a orange circular shape at (177, 114) with radius 48.
; PLAN: r0=364(x), r1=254(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=177(x), r6=114(y), r7=48(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 364
LDI r1, 254
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 177
LDI r6, 114
LDI r7, 48
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT

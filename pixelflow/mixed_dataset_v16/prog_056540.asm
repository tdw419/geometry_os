; DESCRIPTION: Composite: Sets a single cyan pixel at (165, 230) then Creates a yellow circular shape at (177, 174) with radius 26.
; PLAN: r0=165(x), r1=230(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=177(x), r6=174(y), r7=26(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 165
LDI r1, 230
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 177
LDI r6, 174
LDI r7, 26
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT

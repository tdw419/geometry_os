; DESCRIPTION: Composite: Sets a single orange pixel at (59, 252) then Creates a red circular shape at (195, 97) with radius 43.
; PLAN: r0=59(x), r1=252(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=195(x), r6=97(y), r7=43(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 59
LDI r1, 252
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 195
LDI r6, 97
LDI r7, 43
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT

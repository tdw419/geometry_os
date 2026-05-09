; DESCRIPTION: Composite: Places a orange dot at position (177, 120) then Creates a orange circular shape at (341, 160) with radius 18.
; PLAN: r0=177(x), r1=120(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=341(x), r6=160(y), r7=18(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 177
LDI r1, 120
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 341
LDI r6, 160
LDI r7, 18
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT

; DESCRIPTION: Composite: Sets a single orange pixel at (183, 119) then Places a red circle of radius 76 at center (352, 105).
; PLAN: r0=183(x), r1=119(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=352(x), r6=105(y), r7=76(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 183
LDI r1, 119
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 352
LDI r6, 105
LDI r7, 76
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT

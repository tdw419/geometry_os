; DESCRIPTION: Composite: Places a orange dot at position (348, 112) then Creates a orange circular shape at (376, 213) with radius 34.
; PLAN: r0=348(x), r1=112(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=376(x), r6=213(y), r7=34(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 348
LDI r1, 112
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 376
LDI r6, 213
LDI r7, 34
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT

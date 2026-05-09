; DESCRIPTION: Composite: Sets a single orange pixel at (347, 68) then Renders a orange disk with center (116, 126) and radius 57.
; PLAN: r0=347(x), r1=68(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=116(x), r6=126(y), r7=57(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 347
LDI r1, 68
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 116
LDI r6, 126
LDI r7, 57
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT

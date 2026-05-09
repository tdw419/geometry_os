; DESCRIPTION: Composite: Sets a single green pixel at (95, 76) then Creates a white circular shape at (301, 68) with radius 45.
; PLAN: r0=95(x), r1=76(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=301(x), r6=68(y), r7=45(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 95
LDI r1, 76
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 301
LDI r6, 68
LDI r7, 45
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT

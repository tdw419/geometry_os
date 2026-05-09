; DESCRIPTION: Composite: Sets a single cyan pixel at (462, 198) then Creates a white circular shape at (308, 172) with radius 42.
; PLAN: r0=462(x), r1=198(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=308(x), r6=172(y), r7=42(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 462
LDI r1, 198
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 308
LDI r6, 172
LDI r7, 42
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT

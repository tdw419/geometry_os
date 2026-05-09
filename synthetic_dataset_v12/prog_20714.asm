; DESCRIPTION: Composite: Sets a single cyan pixel at (49, 236) then Creates a orange circular shape at (177, 93) with radius 42.
; PLAN: r0=49(x), r1=236(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=177(x), r6=93(y), r7=42(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 49
LDI r1, 236
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 177
LDI r6, 93
LDI r7, 42
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT

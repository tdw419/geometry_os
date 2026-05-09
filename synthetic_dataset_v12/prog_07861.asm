; DESCRIPTION: Composite: Sets a single cyan pixel at (483, 96) then Renders a cyan line between points (86, 97) and (439, 45).
; PLAN: r0=483(x), r1=96(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=86(x1), r6=97(y1), r7=439(x2), r8=45(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 483
LDI r1, 96
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 86
LDI r6, 97
LDI r7, 439
LDI r8, 45
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT

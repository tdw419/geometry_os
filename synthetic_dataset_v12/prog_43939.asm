; DESCRIPTION: Composite: Sets a single cyan pixel at (45, 115) then Renders a red line between points (469, 66) and (343, 186).
; PLAN: r0=45(x), r1=115(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=469(x1), r6=66(y1), r7=343(x2), r8=186(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 45
LDI r1, 115
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 469
LDI r6, 66
LDI r7, 343
LDI r8, 186
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT

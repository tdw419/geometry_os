; DESCRIPTION: Composite: Sets a single cyan pixel at (225, 176) then Renders a yellow line between points (79, 181) and (467, 192).
; PLAN: r0=225(x), r1=176(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=79(x1), r6=181(y1), r7=467(x2), r8=192(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 225
LDI r1, 176
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 79
LDI r6, 181
LDI r7, 467
LDI r8, 192
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT

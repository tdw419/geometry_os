; DESCRIPTION: Composite: Sets a single purple pixel at (323, 168) then Renders a cyan line between points (438, 143) and (388, 7).
; PLAN: r0=323(x), r1=168(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=438(x1), r6=143(y1), r7=388(x2), r8=7(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 323
LDI r1, 168
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 438
LDI r6, 143
LDI r7, 388
LDI r8, 7
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT

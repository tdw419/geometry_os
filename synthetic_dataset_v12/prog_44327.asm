; DESCRIPTION: Composite: Sets a single cyan pixel at (251, 143) then Renders a yellow line between points (411, 227) and (455, 255).
; PLAN: r0=251(x), r1=143(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=411(x1), r6=227(y1), r7=455(x2), r8=255(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 251
LDI r1, 143
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 411
LDI r6, 227
LDI r7, 455
LDI r8, 255
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT

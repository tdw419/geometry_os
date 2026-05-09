; DESCRIPTION: Composite: Sets a single orange pixel at (143, 110) then Renders a black line between points (4, 89) and (44, 101).
; PLAN: r0=143(x), r1=110(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=4(x1), r6=89(y1), r7=44(x2), r8=101(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 143
LDI r1, 110
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 4
LDI r6, 89
LDI r7, 44
LDI r8, 101
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT

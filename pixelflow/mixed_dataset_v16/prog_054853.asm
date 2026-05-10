; DESCRIPTION: Composite: Sets a single green pixel at (250, 101) then Places a red line segment connecting (102, 156) to (87, 119).
; PLAN: r0=250(x), r1=101(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=102(x1), r6=156(y1), r7=87(x2), r8=119(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 250
LDI r1, 101
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 102
LDI r6, 156
LDI r7, 87
LDI r8, 119
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT

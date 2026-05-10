; DESCRIPTION: Composite: Sets a single yellow pixel at (408, 22) then Renders a yellow line between points (282, 75) and (275, 45).
; PLAN: r0=408(x), r1=22(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=282(x1), r6=75(y1), r7=275(x2), r8=45(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 408
LDI r1, 22
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 282
LDI r6, 75
LDI r7, 275
LDI r8, 45
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT

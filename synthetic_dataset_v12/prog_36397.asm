; DESCRIPTION: Composite: Sets a single cyan pixel at (58, 3) then Renders a red line between points (264, 145) and (4, 184).
; PLAN: r0=58(x), r1=3(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=264(x1), r6=145(y1), r7=4(x2), r8=184(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 58
LDI r1, 3
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 264
LDI r6, 145
LDI r7, 4
LDI r8, 184
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT

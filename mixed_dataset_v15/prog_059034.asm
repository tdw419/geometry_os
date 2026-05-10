; DESCRIPTION: Composite: Sets a single cyan pixel at (118, 96) then Renders a green line between points (413, 55) and (399, 229).
; PLAN: r0=118(x), r1=96(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=413(x1), r6=55(y1), r7=399(x2), r8=229(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 118
LDI r1, 96
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 413
LDI r6, 55
LDI r7, 399
LDI r8, 229
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT

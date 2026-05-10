; DESCRIPTION: Composite: Sets a single cyan pixel at (27, 184) then Renders a red line between points (104, 14) and (30, 232).
; PLAN: r0=27(x), r1=184(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=104(x1), r6=14(y1), r7=30(x2), r8=232(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 27
LDI r1, 184
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 104
LDI r6, 14
LDI r7, 30
LDI r8, 232
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT

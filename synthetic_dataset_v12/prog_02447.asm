; DESCRIPTION: Composite: Sets a single black pixel at (336, 210) then Renders a red line between points (218, 104) and (334, 176).
; PLAN: r0=336(x), r1=210(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=218(x1), r6=104(y1), r7=334(x2), r8=176(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 336
LDI r1, 210
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 218
LDI r6, 104
LDI r7, 334
LDI r8, 176
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT

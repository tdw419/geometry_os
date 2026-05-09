; DESCRIPTION: Composite: Sets a single blue pixel at (432, 235) then Renders a cyan line between points (128, 247) and (378, 52).
; PLAN: r0=432(x), r1=235(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=128(x1), r6=247(y1), r7=378(x2), r8=52(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 432
LDI r1, 235
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 128
LDI r6, 247
LDI r7, 378
LDI r8, 52
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT

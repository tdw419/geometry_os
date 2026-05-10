; DESCRIPTION: Composite: Sets a single blue pixel at (497, 235) then Draws a red line from (233, 183) to (483, 228).
; PLAN: r0=497(x), r1=235(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=233(x1), r6=183(y1), r7=483(x2), r8=228(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 497
LDI r1, 235
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 233
LDI r6, 183
LDI r7, 483
LDI r8, 228
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT

; DESCRIPTION: Composite: Sets a single black pixel at (239, 182) then Draws a green line from (94, 188) to (235, 77).
; PLAN: r0=239(x), r1=182(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=94(x1), r6=188(y1), r7=235(x2), r8=77(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 239
LDI r1, 182
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 94
LDI r6, 188
LDI r7, 235
LDI r8, 77
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT

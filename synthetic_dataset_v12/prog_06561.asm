; DESCRIPTION: Composite: Sets a single orange pixel at (472, 109) then Places a yellow line segment connecting (235, 204) to (315, 186).
; PLAN: r0=472(x), r1=109(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=235(x1), r6=204(y1), r7=315(x2), r8=186(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 472
LDI r1, 109
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 235
LDI r6, 204
LDI r7, 315
LDI r8, 186
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT

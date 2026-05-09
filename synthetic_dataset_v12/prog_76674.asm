; DESCRIPTION: Composite: Sets a single green pixel at (316, 192) then Places a cyan line segment connecting (311, 19) to (461, 249).
; PLAN: r0=316(x), r1=192(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=311(x1), r6=19(y1), r7=461(x2), r8=249(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 316
LDI r1, 192
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 311
LDI r6, 19
LDI r7, 461
LDI r8, 249
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT

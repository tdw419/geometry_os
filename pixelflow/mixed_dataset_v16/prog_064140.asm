; DESCRIPTION: Composite: Sets a single black pixel at (507, 81) then Places a cyan line segment connecting (408, 34) to (309, 102).
; PLAN: r0=507(x), r1=81(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=408(x1), r6=34(y1), r7=309(x2), r8=102(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 507
LDI r1, 81
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 408
LDI r6, 34
LDI r7, 309
LDI r8, 102
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT

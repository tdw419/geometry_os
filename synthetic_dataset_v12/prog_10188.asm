; DESCRIPTION: Composite: Sets a single black pixel at (349, 168) then Places a black line segment connecting (0, 199) to (447, 205).
; PLAN: r0=349(x), r1=168(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=0(x1), r6=199(y1), r7=447(x2), r8=205(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 349
LDI r1, 168
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 0
LDI r6, 199
LDI r7, 447
LDI r8, 205
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT

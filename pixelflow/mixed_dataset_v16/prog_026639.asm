; DESCRIPTION: Composite: Sets a single magenta pixel at (447, 211) then Places a orange line segment connecting (328, 104) to (394, 119).
; PLAN: r0=447(x), r1=211(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=328(x1), r6=104(y1), r7=394(x2), r8=119(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 447
LDI r1, 211
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 328
LDI r6, 104
LDI r7, 394
LDI r8, 119
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT

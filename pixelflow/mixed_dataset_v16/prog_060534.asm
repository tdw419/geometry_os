; DESCRIPTION: Composite: Sets a single orange pixel at (171, 92) then Draws a yellow line from (89, 34) to (366, 12).
; PLAN: r0=171(x), r1=92(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=89(x1), r6=34(y1), r7=366(x2), r8=12(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 171
LDI r1, 92
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 89
LDI r6, 34
LDI r7, 366
LDI r8, 12
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT

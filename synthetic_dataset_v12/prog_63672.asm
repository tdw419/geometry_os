; DESCRIPTION: Composite: Sets a single yellow pixel at (1, 77) then Renders a blue line between points (489, 43) and (167, 229).
; PLAN: r0=1(x), r1=77(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=489(x1), r6=43(y1), r7=167(x2), r8=229(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 1
LDI r1, 77
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 489
LDI r6, 43
LDI r7, 167
LDI r8, 229
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT

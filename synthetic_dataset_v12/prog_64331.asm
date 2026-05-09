; DESCRIPTION: Composite: Sets a single yellow pixel at (125, 212) then Places a yellow line segment connecting (133, 131) to (414, 229).
; PLAN: r0=125(x), r1=212(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=133(x1), r6=131(y1), r7=414(x2), r8=229(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 125
LDI r1, 212
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 133
LDI r6, 131
LDI r7, 414
LDI r8, 229
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT

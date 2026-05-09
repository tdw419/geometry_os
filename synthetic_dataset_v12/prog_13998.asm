; DESCRIPTION: Composite: Sets a single yellow pixel at (218, 174) then Renders a blue line between points (358, 12) and (259, 109).
; PLAN: r0=218(x), r1=174(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=358(x1), r6=12(y1), r7=259(x2), r8=109(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 218
LDI r1, 174
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 358
LDI r6, 12
LDI r7, 259
LDI r8, 109
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT

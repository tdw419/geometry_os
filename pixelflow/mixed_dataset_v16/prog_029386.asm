; DESCRIPTION: Composite: Sets a single yellow pixel at (133, 123) then Places a green line segment connecting (59, 202) to (352, 11).
; PLAN: r0=133(x), r1=123(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=59(x1), r6=202(y1), r7=352(x2), r8=11(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 133
LDI r1, 123
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 59
LDI r6, 202
LDI r7, 352
LDI r8, 11
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT

; DESCRIPTION: Composite: Sets a single red pixel at (141, 53) then Draws a cyan line from (422, 158) to (503, 153).
; PLAN: r0=141(x), r1=53(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=422(x1), r6=158(y1), r7=503(x2), r8=153(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 141
LDI r1, 53
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 422
LDI r6, 158
LDI r7, 503
LDI r8, 153
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT

; DESCRIPTION: Composite: Sets a single purple pixel at (434, 188) then Draws a purple line from (97, 48) to (347, 241).
; PLAN: r0=434(x), r1=188(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=97(x1), r6=48(y1), r7=347(x2), r8=241(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 434
LDI r1, 188
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 97
LDI r6, 48
LDI r7, 347
LDI r8, 241
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT

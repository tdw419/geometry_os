; DESCRIPTION: Composite: Sets a single blue pixel at (396, 36) then Renders a purple line between points (217, 229) and (296, 90).
; PLAN: r0=396(x), r1=36(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=217(x1), r6=229(y1), r7=296(x2), r8=90(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 396
LDI r1, 36
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 217
LDI r6, 229
LDI r7, 296
LDI r8, 90
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT

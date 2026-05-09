; DESCRIPTION: Composite: . Then Sets a single magenta pixel at (11, 246). Then Draws a purple line from (229, 104) to (66, 147).
; PLAN: r0=11(x), r1=246(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r0=229(x1), r1=104(y1), r2=66(x2), r3=147(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single magenta pixel at (11, 246).
; PLAN: r0=11(x), r1=246(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 11
LDI r1, 246
LDI r2, 0xFF00FF
PSET r0, r1, r2
; DESCRIPTION: Draws a purple line from (229, 104) to (66, 147).
; PLAN: r0=229(x1), r1=104(y1), r2=66(x2), r3=147(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 104
LDI r2, 66
LDI r3, 147
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

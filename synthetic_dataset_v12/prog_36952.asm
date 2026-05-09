; DESCRIPTION: Composite: Sets a single magenta pixel at (29, 229) then Draws a purple line from (340, 139) to (250, 39).
; PLAN: r0=29(x), r1=229(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=340(x1), r6=139(y1), r7=250(x2), r8=39(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 29
LDI r1, 229
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 340
LDI r6, 139
LDI r7, 250
LDI r8, 39
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT

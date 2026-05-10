; DESCRIPTION: Composite: Sets a single red pixel at (322, 108) then Draws a purple line from (3, 222) to (182, 178).
; PLAN: r0=322(x), r1=108(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=3(x1), r6=222(y1), r7=182(x2), r8=178(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 322
LDI r1, 108
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 3
LDI r6, 222
LDI r7, 182
LDI r8, 178
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT

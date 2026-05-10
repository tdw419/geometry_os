; DESCRIPTION: Composite: Draws a purple line from (122, 126) to (395, 71) then Sets a single yellow pixel at (467, 68).
; PLAN: r0=122(x1), r1=126(y1), r2=395(x2), r3=71(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=467(x), r6=68(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 122
LDI r1, 126
LDI r2, 395
LDI r3, 71
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 467
LDI r6, 68
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT

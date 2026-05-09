; DESCRIPTION: Composite: Draws a purple line from (210, 176) to (376, 46) then Sets a single red pixel at (161, 87).
; PLAN: r0=210(x1), r1=176(y1), r2=376(x2), r3=46(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=161(x), r6=87(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 210
LDI r1, 176
LDI r2, 376
LDI r3, 46
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 161
LDI r6, 87
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT

; DESCRIPTION: Draws a red line from (381, 191) to (314, 182).
; PLAN: r0=381(x1), r1=191(y1), r2=314(x2), r3=182(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 191
LDI r2, 314
LDI r3, 182
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

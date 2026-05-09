; DESCRIPTION: Draws a yellow line from (335, 7) to (314, 247).
; PLAN: r0=335(x1), r1=7(y1), r2=314(x2), r3=247(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 7
LDI r2, 314
LDI r3, 247
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

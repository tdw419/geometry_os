; DESCRIPTION: Draws a yellow line from (315, 36) to (106, 185).
; PLAN: r0=315(x1), r1=36(y1), r2=106(x2), r3=185(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 36
LDI r2, 106
LDI r3, 185
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

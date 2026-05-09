; DESCRIPTION: Draws a yellow line from (335, 20) to (78, 169).
; PLAN: r0=335(x1), r1=20(y1), r2=78(x2), r3=169(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 20
LDI r2, 78
LDI r3, 169
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

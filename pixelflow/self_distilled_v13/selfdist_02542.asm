; DESCRIPTION: Draws a blue line from (34, 3) to (335, 78).
; PLAN: r0=34(x1), r1=3(y1), r2=335(x2), r3=78(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 3
LDI r2, 335
LDI r3, 78
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

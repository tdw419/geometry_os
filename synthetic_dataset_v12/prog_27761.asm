; DESCRIPTION: Draws a blue line from (377, 102) to (323, 7).
; PLAN: r0=377(x1), r1=102(y1), r2=323(x2), r3=7(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 102
LDI r2, 323
LDI r3, 7
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

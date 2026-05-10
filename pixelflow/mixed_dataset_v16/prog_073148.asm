; DESCRIPTION: Draws a blue line from (323, 65) to (389, 56).
; PLAN: r0=323(x1), r1=65(y1), r2=389(x2), r3=56(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 65
LDI r2, 389
LDI r3, 56
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

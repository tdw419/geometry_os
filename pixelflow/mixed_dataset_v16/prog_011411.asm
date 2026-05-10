; DESCRIPTION: Draws a blue line from (390, 190) to (3, 69).
; PLAN: r0=390(x1), r1=190(y1), r2=3(x2), r3=69(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 190
LDI r2, 3
LDI r3, 69
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

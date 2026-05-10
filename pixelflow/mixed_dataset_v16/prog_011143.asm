; DESCRIPTION: Draws a blue line from (163, 24) to (301, 106).
; PLAN: r0=163(x1), r1=24(y1), r2=301(x2), r3=106(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 24
LDI r2, 301
LDI r3, 106
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

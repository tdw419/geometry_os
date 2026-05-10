; DESCRIPTION: Draws a purple line from (93, 79) to (302, 191).
; PLAN: r0=93(x1), r1=79(y1), r2=302(x2), r3=191(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 79
LDI r2, 302
LDI r3, 191
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

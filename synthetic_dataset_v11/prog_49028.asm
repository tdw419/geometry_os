; DESCRIPTION: Draws a purple line from (190, 184) to (55, 226).
; PLAN: r0=190(x1), r1=184(y1), r2=55(x2), r3=226(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 184
LDI r2, 55
LDI r3, 226
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

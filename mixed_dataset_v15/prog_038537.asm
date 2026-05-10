; DESCRIPTION: Draws a purple line from (118, 247) to (287, 238).
; PLAN: r0=118(x1), r1=247(y1), r2=287(x2), r3=238(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 247
LDI r2, 287
LDI r3, 238
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

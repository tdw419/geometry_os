; DESCRIPTION: Draws a purple line from (35, 106) to (199, 212).
; PLAN: r0=35(x1), r1=106(y1), r2=199(x2), r3=212(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 106
LDI r2, 199
LDI r3, 212
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

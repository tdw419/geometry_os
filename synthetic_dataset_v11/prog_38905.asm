; DESCRIPTION: Draws a purple line from (194, 161) to (199, 158).
; PLAN: r0=194(x1), r1=161(y1), r2=199(x2), r3=158(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 161
LDI r2, 199
LDI r3, 158
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

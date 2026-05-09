; DESCRIPTION: Draws a purple line from (417, 211) to (200, 121).
; PLAN: r0=417(x1), r1=211(y1), r2=200(x2), r3=121(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 211
LDI r2, 200
LDI r3, 121
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

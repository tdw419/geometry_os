; DESCRIPTION: Draws a purple line from (321, 161) to (490, 183).
; PLAN: r0=321(x1), r1=161(y1), r2=490(x2), r3=183(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 161
LDI r2, 490
LDI r3, 183
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

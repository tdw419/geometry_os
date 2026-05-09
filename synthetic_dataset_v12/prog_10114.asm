; DESCRIPTION: Draws a purple line from (153, 211) to (9, 186).
; PLAN: r0=153(x1), r1=211(y1), r2=9(x2), r3=186(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 211
LDI r2, 9
LDI r3, 186
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

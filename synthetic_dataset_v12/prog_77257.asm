; DESCRIPTION: Draws a purple line from (253, 118) to (14, 31).
; PLAN: r0=253(x1), r1=118(y1), r2=14(x2), r3=31(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 118
LDI r2, 14
LDI r3, 31
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

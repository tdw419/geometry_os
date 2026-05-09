; DESCRIPTION: Draws a purple line from (110, 215) to (118, 22).
; PLAN: r0=110(x1), r1=215(y1), r2=118(x2), r3=22(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 215
LDI r2, 118
LDI r3, 22
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

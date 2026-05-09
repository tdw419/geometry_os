; DESCRIPTION: Draws a purple line from (484, 211) to (110, 196).
; PLAN: r0=484(x1), r1=211(y1), r2=110(x2), r3=196(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 484
LDI r1, 211
LDI r2, 110
LDI r3, 196
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

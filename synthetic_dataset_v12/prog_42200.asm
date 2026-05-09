; DESCRIPTION: Draws a purple line from (158, 151) to (435, 2).
; PLAN: r0=158(x1), r1=151(y1), r2=435(x2), r3=2(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 151
LDI r2, 435
LDI r3, 2
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

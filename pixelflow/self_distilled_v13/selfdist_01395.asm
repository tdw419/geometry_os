; DESCRIPTION: Draws a purple line from (96, 54) to (119, 60).
; PLAN: r0=96(x1), r1=54(y1), r2=119(x2), r3=60(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 54
LDI r2, 119
LDI r3, 60
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

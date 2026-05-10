; DESCRIPTION: Draws a purple line from (179, 124) to (135, 106).
; PLAN: r0=179(x1), r1=124(y1), r2=135(x2), r3=106(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 124
LDI r2, 135
LDI r3, 106
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

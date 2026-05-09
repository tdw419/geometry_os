; DESCRIPTION: Draws a purple line from (157, 70) to (135, 4).
; PLAN: r0=157(x1), r1=70(y1), r2=135(x2), r3=4(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 70
LDI r2, 135
LDI r3, 4
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

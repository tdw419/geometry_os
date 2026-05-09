; DESCRIPTION: Draws a purple line from (79, 81) to (135, 120).
; PLAN: r0=79(x1), r1=81(y1), r2=135(x2), r3=120(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 81
LDI r2, 135
LDI r3, 120
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

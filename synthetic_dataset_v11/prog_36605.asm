; DESCRIPTION: Draws a purple line from (112, 117) to (35, 20).
; PLAN: r0=112(x1), r1=117(y1), r2=35(x2), r3=20(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 117
LDI r2, 35
LDI r3, 20
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

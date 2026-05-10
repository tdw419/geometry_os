; DESCRIPTION: Draws a purple line from (80, 112) to (229, 75).
; PLAN: r0=80(x1), r1=112(y1), r2=229(x2), r3=75(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 112
LDI r2, 229
LDI r3, 75
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a purple line from (47, 80) to (450, 13).
; PLAN: r0=47(x1), r1=80(y1), r2=450(x2), r3=13(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 80
LDI r2, 450
LDI r3, 13
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

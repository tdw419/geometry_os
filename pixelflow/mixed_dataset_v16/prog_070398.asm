; DESCRIPTION: Draws a purple line from (462, 15) to (435, 31).
; PLAN: r0=462(x1), r1=15(y1), r2=435(x2), r3=31(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 15
LDI r2, 435
LDI r3, 31
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a purple line from (250, 18) to (2, 94).
; PLAN: r0=250(x1), r1=18(y1), r2=2(x2), r3=94(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 18
LDI r2, 2
LDI r3, 94
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

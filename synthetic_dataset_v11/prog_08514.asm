; DESCRIPTION: Draws a purple line from (2, 3) to (46, 105).
; PLAN: r0=2(x1), r1=3(y1), r2=46(x2), r3=105(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 3
LDI r2, 46
LDI r3, 105
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

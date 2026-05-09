; DESCRIPTION: Draws a purple line from (188, 127) to (105, 85).
; PLAN: r0=188(x1), r1=127(y1), r2=105(x2), r3=85(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 127
LDI r2, 105
LDI r3, 85
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

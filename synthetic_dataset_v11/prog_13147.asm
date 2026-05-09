; DESCRIPTION: Draws a purple line from (7, 149) to (207, 112).
; PLAN: r0=7(x1), r1=149(y1), r2=207(x2), r3=112(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 149
LDI r2, 207
LDI r3, 112
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

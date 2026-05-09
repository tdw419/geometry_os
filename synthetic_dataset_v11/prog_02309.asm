; DESCRIPTION: Draws a purple line from (106, 8) to (61, 22).
; PLAN: r0=106(x1), r1=8(y1), r2=61(x2), r3=22(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 8
LDI r2, 61
LDI r3, 22
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

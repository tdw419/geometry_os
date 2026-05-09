; DESCRIPTION: Draws a purple line from (40, 91) to (500, 144).
; PLAN: r0=40(x1), r1=91(y1), r2=500(x2), r3=144(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 91
LDI r2, 500
LDI r3, 144
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

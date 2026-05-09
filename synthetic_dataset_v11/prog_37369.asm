; DESCRIPTION: Draws a purple line from (99, 3) to (130, 160).
; PLAN: r0=99(x1), r1=3(y1), r2=130(x2), r3=160(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 3
LDI r2, 130
LDI r3, 160
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

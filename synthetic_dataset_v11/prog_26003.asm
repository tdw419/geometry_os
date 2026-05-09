; DESCRIPTION: Draws a purple line from (162, 21) to (100, 72).
; PLAN: r0=162(x1), r1=21(y1), r2=100(x2), r3=72(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 21
LDI r2, 100
LDI r3, 72
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

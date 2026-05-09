; DESCRIPTION: Draws a purple line from (148, 119) to (254, 252).
; PLAN: r0=148(x1), r1=119(y1), r2=254(x2), r3=252(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 119
LDI r2, 254
LDI r3, 252
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

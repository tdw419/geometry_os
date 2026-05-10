; DESCRIPTION: Renders a purple line segment connecting (117, 181) to (158, 46).
; PLAN: r0=117(x1), r1=181(y1), r2=158(x2), r3=46(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 181
LDI r2, 158
LDI r3, 46
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

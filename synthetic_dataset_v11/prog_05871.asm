; DESCRIPTION: Places a yellow line segment connecting (191, 127) to (88, 145).
; PLAN: r0=191(x1), r1=127(y1), r2=88(x2), r3=145(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 127
LDI r2, 88
LDI r3, 145
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

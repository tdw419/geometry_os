; DESCRIPTION: Places a green line segment connecting (172, 84) to (169, 217).
; PLAN: r0=172(x1), r1=84(y1), r2=169(x2), r3=217(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 84
LDI r2, 169
LDI r3, 217
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

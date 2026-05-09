; DESCRIPTION: Places a yellow line segment connecting (97, 162) to (70, 148).
; PLAN: r0=97(x1), r1=162(y1), r2=70(x2), r3=148(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 162
LDI r2, 70
LDI r3, 148
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

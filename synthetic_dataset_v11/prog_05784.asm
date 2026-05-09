; DESCRIPTION: Places a yellow line segment connecting (153, 70) to (169, 46).
; PLAN: r0=153(x1), r1=70(y1), r2=169(x2), r3=46(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 70
LDI r2, 169
LDI r3, 46
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

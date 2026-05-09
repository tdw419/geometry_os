; DESCRIPTION: Places a blue line segment connecting (507, 185) to (169, 54).
; PLAN: r0=507(x1), r1=185(y1), r2=169(x2), r3=54(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 507
LDI r1, 185
LDI r2, 169
LDI r3, 54
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

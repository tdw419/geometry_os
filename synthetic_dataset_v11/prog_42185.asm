; DESCRIPTION: Places a yellow line segment connecting (69, 169) to (24, 70).
; PLAN: r0=69(x1), r1=169(y1), r2=24(x2), r3=70(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 169
LDI r2, 24
LDI r3, 70
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

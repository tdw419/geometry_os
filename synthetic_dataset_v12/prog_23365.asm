; DESCRIPTION: Places a yellow line segment connecting (10, 192) to (462, 169).
; PLAN: r0=10(x1), r1=192(y1), r2=462(x2), r3=169(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 192
LDI r2, 462
LDI r3, 169
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

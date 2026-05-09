; DESCRIPTION: Places a yellow line segment connecting (169, 117) to (123, 10).
; PLAN: r0=169(x1), r1=117(y1), r2=123(x2), r3=10(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 117
LDI r2, 123
LDI r3, 10
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

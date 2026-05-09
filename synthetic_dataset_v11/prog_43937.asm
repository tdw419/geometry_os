; DESCRIPTION: Places a yellow line segment connecting (169, 153) to (187, 104).
; PLAN: r0=169(x1), r1=153(y1), r2=187(x2), r3=104(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 153
LDI r2, 187
LDI r3, 104
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

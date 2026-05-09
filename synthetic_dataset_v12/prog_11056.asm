; DESCRIPTION: Places a yellow line segment connecting (273, 109) to (102, 152).
; PLAN: r0=273(x1), r1=109(y1), r2=102(x2), r3=152(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 109
LDI r2, 102
LDI r3, 152
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a yellow line segment connecting (152, 88) to (190, 96).
; PLAN: r0=152(x1), r1=88(y1), r2=190(x2), r3=96(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 88
LDI r2, 190
LDI r3, 96
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

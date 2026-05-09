; DESCRIPTION: Places a magenta line segment connecting (152, 233) to (88, 118).
; PLAN: r0=152(x1), r1=233(y1), r2=88(x2), r3=118(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 233
LDI r2, 88
LDI r3, 118
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

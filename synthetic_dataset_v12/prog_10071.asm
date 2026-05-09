; DESCRIPTION: Places a magenta line segment connecting (56, 47) to (152, 248).
; PLAN: r0=56(x1), r1=47(y1), r2=152(x2), r3=248(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 47
LDI r2, 152
LDI r3, 248
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

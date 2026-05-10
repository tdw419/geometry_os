; DESCRIPTION: Places a magenta line segment connecting (504, 58) to (161, 97).
; PLAN: r0=504(x1), r1=58(y1), r2=161(x2), r3=97(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 504
LDI r1, 58
LDI r2, 161
LDI r3, 97
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

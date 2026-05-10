; DESCRIPTION: Places a magenta line segment connecting (313, 174) to (13, 85).
; PLAN: r0=313(x1), r1=174(y1), r2=13(x2), r3=85(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 174
LDI r2, 13
LDI r3, 85
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

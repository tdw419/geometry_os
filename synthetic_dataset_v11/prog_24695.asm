; DESCRIPTION: Places a magenta line segment connecting (1, 141) to (40, 54).
; PLAN: r0=1(x1), r1=141(y1), r2=40(x2), r3=54(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 141
LDI r2, 40
LDI r3, 54
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

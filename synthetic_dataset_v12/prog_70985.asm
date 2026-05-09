; DESCRIPTION: Places a magenta line segment connecting (9, 119) to (113, 123).
; PLAN: r0=9(x1), r1=119(y1), r2=113(x2), r3=123(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 119
LDI r2, 113
LDI r3, 123
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

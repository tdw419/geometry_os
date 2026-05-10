; DESCRIPTION: Places a magenta line segment connecting (390, 153) to (152, 101).
; PLAN: r0=390(x1), r1=153(y1), r2=152(x2), r3=101(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 153
LDI r2, 152
LDI r3, 101
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

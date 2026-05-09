; DESCRIPTION: Places a magenta line segment connecting (240, 123) to (431, 216).
; PLAN: r0=240(x1), r1=123(y1), r2=431(x2), r3=216(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 123
LDI r2, 431
LDI r3, 216
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a magenta line segment connecting (390, 87) to (27, 118).
; PLAN: r0=390(x1), r1=87(y1), r2=27(x2), r3=118(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 87
LDI r2, 27
LDI r3, 118
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

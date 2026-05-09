; DESCRIPTION: Draws a magenta line from (152, 216) to (80, 90).
; PLAN: r0=152(x1), r1=216(y1), r2=80(x2), r3=90(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 216
LDI r2, 80
LDI r3, 90
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

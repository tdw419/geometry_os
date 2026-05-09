; DESCRIPTION: Places a magenta line segment connecting (453, 216) to (150, 5).
; PLAN: r0=453(x1), r1=216(y1), r2=150(x2), r3=5(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 216
LDI r2, 150
LDI r3, 5
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

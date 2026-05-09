; DESCRIPTION: Places a magenta line segment connecting (200, 158) to (485, 142).
; PLAN: r0=200(x1), r1=158(y1), r2=485(x2), r3=142(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 158
LDI r2, 485
LDI r3, 142
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a magenta line segment connecting (22, 184) to (200, 98).
; PLAN: r0=22(x1), r1=184(y1), r2=200(x2), r3=98(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 184
LDI r2, 200
LDI r3, 98
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

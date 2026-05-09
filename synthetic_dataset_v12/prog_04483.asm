; DESCRIPTION: Places a magenta line segment connecting (266, 84) to (100, 5).
; PLAN: r0=266(x1), r1=84(y1), r2=100(x2), r3=5(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 84
LDI r2, 100
LDI r3, 5
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

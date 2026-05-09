; DESCRIPTION: Places a magenta line segment connecting (267, 110) to (118, 84).
; PLAN: r0=267(x1), r1=110(y1), r2=118(x2), r3=84(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 110
LDI r2, 118
LDI r3, 84
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

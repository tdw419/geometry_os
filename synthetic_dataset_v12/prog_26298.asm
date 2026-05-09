; DESCRIPTION: Places a magenta line segment connecting (454, 9) to (79, 118).
; PLAN: r0=454(x1), r1=9(y1), r2=79(x2), r3=118(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 9
LDI r2, 79
LDI r3, 118
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

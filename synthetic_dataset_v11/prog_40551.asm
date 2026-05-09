; DESCRIPTION: Places a magenta line segment connecting (79, 75) to (91, 140).
; PLAN: r0=79(x1), r1=75(y1), r2=91(x2), r3=140(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 75
LDI r2, 91
LDI r3, 140
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

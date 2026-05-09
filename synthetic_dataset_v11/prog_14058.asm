; DESCRIPTION: Places a magenta line segment connecting (174, 226) to (89, 106).
; PLAN: r0=174(x1), r1=226(y1), r2=89(x2), r3=106(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 226
LDI r2, 89
LDI r3, 106
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

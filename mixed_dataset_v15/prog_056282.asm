; DESCRIPTION: Places a magenta line segment connecting (343, 146) to (208, 201).
; PLAN: r0=343(x1), r1=146(y1), r2=208(x2), r3=201(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 146
LDI r2, 208
LDI r3, 201
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

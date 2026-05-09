; DESCRIPTION: Places a magenta line segment connecting (399, 177) to (311, 70).
; PLAN: r0=399(x1), r1=177(y1), r2=311(x2), r3=70(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 177
LDI r2, 311
LDI r3, 70
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

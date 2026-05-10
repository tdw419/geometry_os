; DESCRIPTION: Places a magenta line segment connecting (411, 77) to (411, 99).
; PLAN: r0=411(x1), r1=77(y1), r2=411(x2), r3=99(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 77
LDI r2, 411
LDI r3, 99
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

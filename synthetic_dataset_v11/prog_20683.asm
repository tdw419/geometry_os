; DESCRIPTION: Places a magenta line segment connecting (99, 187) to (140, 141).
; PLAN: r0=99(x1), r1=187(y1), r2=140(x2), r3=141(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 187
LDI r2, 140
LDI r3, 141
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

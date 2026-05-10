; DESCRIPTION: Places a magenta line segment connecting (146, 153) to (457, 118).
; PLAN: r0=146(x1), r1=153(y1), r2=457(x2), r3=118(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 153
LDI r2, 457
LDI r3, 118
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

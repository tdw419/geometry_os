; DESCRIPTION: Places a magenta line segment connecting (188, 30) to (93, 112).
; PLAN: r0=188(x1), r1=30(y1), r2=93(x2), r3=112(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 30
LDI r2, 93
LDI r3, 112
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

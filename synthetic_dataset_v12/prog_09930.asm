; DESCRIPTION: Places a magenta line segment connecting (172, 208) to (133, 136).
; PLAN: r0=172(x1), r1=208(y1), r2=133(x2), r3=136(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 208
LDI r2, 133
LDI r3, 136
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

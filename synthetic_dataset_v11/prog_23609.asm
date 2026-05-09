; DESCRIPTION: Places a magenta line segment connecting (184, 24) to (133, 158).
; PLAN: r0=184(x1), r1=24(y1), r2=133(x2), r3=158(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 24
LDI r2, 133
LDI r3, 158
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

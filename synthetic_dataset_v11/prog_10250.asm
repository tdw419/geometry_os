; DESCRIPTION: Places a magenta line segment connecting (3, 252) to (30, 133).
; PLAN: r0=3(x1), r1=252(y1), r2=30(x2), r3=133(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 252
LDI r2, 30
LDI r3, 133
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

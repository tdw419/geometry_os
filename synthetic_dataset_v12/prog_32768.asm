; DESCRIPTION: Places a magenta line segment connecting (72, 252) to (168, 147).
; PLAN: r0=72(x1), r1=252(y1), r2=168(x2), r3=147(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 252
LDI r2, 168
LDI r3, 147
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

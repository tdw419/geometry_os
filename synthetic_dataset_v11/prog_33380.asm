; DESCRIPTION: Places a magenta line segment connecting (31, 147) to (102, 252).
; PLAN: r0=31(x1), r1=147(y1), r2=102(x2), r3=252(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 147
LDI r2, 102
LDI r3, 252
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

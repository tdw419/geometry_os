; DESCRIPTION: Places a magenta line segment connecting (377, 30) to (472, 102).
; PLAN: r0=377(x1), r1=30(y1), r2=472(x2), r3=102(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 30
LDI r2, 472
LDI r3, 102
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

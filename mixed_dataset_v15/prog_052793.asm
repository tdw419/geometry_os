; DESCRIPTION: Places a magenta line segment connecting (30, 102) to (449, 123).
; PLAN: r0=30(x1), r1=102(y1), r2=449(x2), r3=123(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 102
LDI r2, 449
LDI r3, 123
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

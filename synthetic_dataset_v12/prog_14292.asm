; DESCRIPTION: Places a magenta line segment connecting (339, 227) to (311, 237).
; PLAN: r0=339(x1), r1=227(y1), r2=311(x2), r3=237(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 227
LDI r2, 311
LDI r3, 237
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

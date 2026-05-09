; DESCRIPTION: Places a magenta line segment connecting (134, 137) to (93, 167).
; PLAN: r0=134(x1), r1=137(y1), r2=93(x2), r3=167(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 137
LDI r2, 93
LDI r3, 167
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

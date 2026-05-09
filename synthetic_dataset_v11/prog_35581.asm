; DESCRIPTION: Places a magenta line segment connecting (193, 208) to (6, 153).
; PLAN: r0=193(x1), r1=208(y1), r2=6(x2), r3=153(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 208
LDI r2, 6
LDI r3, 153
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

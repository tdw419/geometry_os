; DESCRIPTION: Places a magenta line segment connecting (21, 131) to (49, 15).
; PLAN: r0=21(x1), r1=131(y1), r2=49(x2), r3=15(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 131
LDI r2, 49
LDI r3, 15
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

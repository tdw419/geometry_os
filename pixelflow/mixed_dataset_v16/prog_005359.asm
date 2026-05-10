; DESCRIPTION: Places a magenta line segment connecting (360, 246) to (1, 131).
; PLAN: r0=360(x1), r1=246(y1), r2=1(x2), r3=131(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 246
LDI r2, 1
LDI r3, 131
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a magenta line segment connecting (311, 116) to (447, 119).
; PLAN: r0=311(x1), r1=116(y1), r2=447(x2), r3=119(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 116
LDI r2, 447
LDI r3, 119
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a magenta line segment connecting (448, 100) to (270, 95).
; PLAN: r0=448(x1), r1=100(y1), r2=270(x2), r3=95(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 100
LDI r2, 270
LDI r3, 95
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

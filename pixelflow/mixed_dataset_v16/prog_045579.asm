; DESCRIPTION: Places a magenta line segment connecting (324, 95) to (423, 77).
; PLAN: r0=324(x1), r1=95(y1), r2=423(x2), r3=77(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 95
LDI r2, 423
LDI r3, 77
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

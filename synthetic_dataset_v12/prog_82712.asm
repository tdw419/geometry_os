; DESCRIPTION: Places a magenta line segment connecting (292, 77) to (314, 127).
; PLAN: r0=292(x1), r1=77(y1), r2=314(x2), r3=127(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 77
LDI r2, 314
LDI r3, 127
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

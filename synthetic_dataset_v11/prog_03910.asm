; DESCRIPTION: Places a magenta line segment connecting (223, 100) to (182, 106).
; PLAN: r0=223(x1), r1=100(y1), r2=182(x2), r3=106(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 100
LDI r2, 182
LDI r3, 106
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

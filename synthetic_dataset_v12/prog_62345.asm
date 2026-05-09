; DESCRIPTION: Places a magenta line segment connecting (79, 77) to (101, 71).
; PLAN: r0=79(x1), r1=77(y1), r2=101(x2), r3=71(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 77
LDI r2, 101
LDI r3, 71
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

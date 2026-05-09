; DESCRIPTION: Places a magenta line segment connecting (194, 7) to (250, 7).
; PLAN: r0=194(x1), r1=7(y1), r2=250(x2), r3=7(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 7
LDI r2, 250
LDI r3, 7
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

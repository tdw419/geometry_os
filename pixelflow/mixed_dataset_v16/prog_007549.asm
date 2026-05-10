; DESCRIPTION: Places a magenta line segment connecting (247, 183) to (110, 185).
; PLAN: r0=247(x1), r1=183(y1), r2=110(x2), r3=185(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 183
LDI r2, 110
LDI r3, 185
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

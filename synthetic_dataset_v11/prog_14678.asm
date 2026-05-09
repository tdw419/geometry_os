; DESCRIPTION: Places a magenta line segment connecting (180, 77) to (145, 22).
; PLAN: r0=180(x1), r1=77(y1), r2=145(x2), r3=22(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 77
LDI r2, 145
LDI r3, 22
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

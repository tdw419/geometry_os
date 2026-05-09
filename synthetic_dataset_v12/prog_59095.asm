; DESCRIPTION: Places a magenta line segment connecting (280, 83) to (343, 169).
; PLAN: r0=280(x1), r1=83(y1), r2=343(x2), r3=169(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 83
LDI r2, 343
LDI r3, 169
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

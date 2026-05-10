; DESCRIPTION: Places a green line segment connecting (381, 145) to (343, 85).
; PLAN: r0=381(x1), r1=145(y1), r2=343(x2), r3=85(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 145
LDI r2, 343
LDI r3, 85
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

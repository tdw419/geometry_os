; DESCRIPTION: Places a magenta line segment connecting (365, 118) to (287, 181).
; PLAN: r0=365(x1), r1=118(y1), r2=287(x2), r3=181(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 118
LDI r2, 287
LDI r3, 181
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

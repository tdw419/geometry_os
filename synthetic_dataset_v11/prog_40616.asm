; DESCRIPTION: Places a magenta line segment connecting (145, 25) to (155, 45).
; PLAN: r0=145(x1), r1=25(y1), r2=155(x2), r3=45(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 25
LDI r2, 155
LDI r3, 45
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

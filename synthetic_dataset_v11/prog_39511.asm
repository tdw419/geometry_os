; DESCRIPTION: Renders a magenta line between points (145, 89) and (207, 110).
; PLAN: r0=145(x1), r1=89(y1), r2=207(x2), r3=110(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 89
LDI r2, 207
LDI r3, 110
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

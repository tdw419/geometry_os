; DESCRIPTION: Places a magenta line segment connecting (81, 51) to (89, 80).
; PLAN: r0=81(x1), r1=51(y1), r2=89(x2), r3=80(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 51
LDI r2, 89
LDI r3, 80
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a magenta line from (389, 77) to (118, 78).
; PLAN: r0=389(x1), r1=77(y1), r2=118(x2), r3=78(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 77
LDI r2, 118
LDI r3, 78
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

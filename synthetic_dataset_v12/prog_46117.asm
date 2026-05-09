; DESCRIPTION: Draws a magenta line from (262, 110) to (466, 145).
; PLAN: r0=262(x1), r1=110(y1), r2=466(x2), r3=145(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 110
LDI r2, 466
LDI r3, 145
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

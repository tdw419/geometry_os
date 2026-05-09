; DESCRIPTION: Draws a magenta line from (20, 61) to (89, 163).
; PLAN: r0=20(x1), r1=61(y1), r2=89(x2), r3=163(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 61
LDI r2, 89
LDI r3, 163
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

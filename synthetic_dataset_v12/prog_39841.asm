; DESCRIPTION: Draws a magenta line from (11, 171) to (89, 205).
; PLAN: r0=11(x1), r1=171(y1), r2=89(x2), r3=205(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 171
LDI r2, 89
LDI r3, 205
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

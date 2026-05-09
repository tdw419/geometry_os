; DESCRIPTION: Draws a magenta line from (109, 30) to (199, 54).
; PLAN: r0=109(x1), r1=30(y1), r2=199(x2), r3=54(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 30
LDI r2, 199
LDI r3, 54
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a magenta line from (199, 89) to (332, 20).
; PLAN: r0=199(x1), r1=89(y1), r2=332(x2), r3=20(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 89
LDI r2, 332
LDI r3, 20
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

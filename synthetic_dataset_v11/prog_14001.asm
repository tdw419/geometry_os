; DESCRIPTION: Places a magenta line segment connecting (199, 89) to (192, 230).
; PLAN: r0=199(x1), r1=89(y1), r2=192(x2), r3=230(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 89
LDI r2, 192
LDI r3, 230
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a blue line segment connecting (94, 188) to (199, 160).
; PLAN: r0=94(x1), r1=188(y1), r2=199(x2), r3=160(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 188
LDI r2, 199
LDI r3, 160
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

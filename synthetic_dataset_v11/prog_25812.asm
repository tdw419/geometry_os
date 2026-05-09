; DESCRIPTION: Draws a blue line from (199, 186) to (155, 78).
; PLAN: r0=199(x1), r1=186(y1), r2=155(x2), r3=78(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 186
LDI r2, 155
LDI r3, 78
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

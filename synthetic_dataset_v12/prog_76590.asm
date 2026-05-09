; DESCRIPTION: Places a magenta line segment connecting (505, 43) to (400, 105).
; PLAN: r0=505(x1), r1=43(y1), r2=400(x2), r3=105(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 505
LDI r1, 43
LDI r2, 400
LDI r3, 105
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

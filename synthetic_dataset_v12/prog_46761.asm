; DESCRIPTION: Places a magenta line segment connecting (375, 161) to (136, 105).
; PLAN: r0=375(x1), r1=161(y1), r2=136(x2), r3=105(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 161
LDI r2, 136
LDI r3, 105
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
